import 'package:ai_radio/model/radio.dart';
import 'package:ai_radio/utils/ai_util.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MyRadio>? radios;
  MyRadio? _selectedradio;
  Color? _selectedColor;
  bool _isPlaying = false;

  final AudioPlayer _audioplayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    fetchRadios();

    _audioplayer.onPlayerStateChanged.listen((event) {
      if (event == PlayerState.playing) {
        _isPlaying = true;
      } else {
        _isPlaying = false;
      }
      setState(() {});
    });
  }

  fetchRadios() async {
    final radioJson = await rootBundle.loadString("assets/radio.json");
    setState(() {
      radios = MyRadioList.fromJson(radioJson).radios;
    });
  }

  playMusic(String url) {
    _audioplayer.play(UrlSource(url));
    _selectedradio = radios?.firstWhere((element) => element.url == url);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('AI Radio'),
      //   backgroundColor: Colors.transparent,
      // ),
      drawer: Drawer(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          VxAnimatedBox()
              .size(context.screenWidth, context.screenHeight)
              .withGradient(
                LinearGradient(
                  colors: [
                    AIColors.primaryColor1,
                    AIColors.primaryColor2,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              )
              .make(),
          AppBar(
            title: "AI Radio".text.xl4.bold.wide.make().shimmer(
                primaryColor: Colors.purple.shade500,
                secondaryColor: Colors.white),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ).p(5),
          VxSwiper.builder(
            aspectRatio: 1.0,
            enlargeCenterPage: true,
            itemCount: radios?.length ?? 0,
            itemBuilder: ((context, index) {
              if (radios != null) {
                final rad = radios![index];
                return VxBox(
                  child: ZStack(
                    [
                      Positioned(
                        top: 0.0,
                        right: 0.0,
                        child: VxBox(
                          child:
                              rad.category.text.uppercase.white.make().px16(),
                        )
                            .height(40)
                            .black
                            .alignCenter
                            .withRounded(value: 10.0)
                            .make(),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: [
                            const Icon(
                              CupertinoIcons.play_circle,
                              color: Colors.white,
                            ),
                            10.heightBox,
                            "Double tap to play".text.gray300.make(),
                          ].vStack()),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: VStack(
                          [
                            rad.name.text.xl3.wide.white.bold.make(),
                            5.heightBox,
                            rad.tagline.text.sm.white.semiBold.make(),
                          ],
                          crossAlignment: CrossAxisAlignment.center,
                        ),
                      ),
                    ],
                  ),
                )
                    .clip(Clip.antiAlias)
                    .bgImage(
                      DecorationImage(
                          image: NetworkImage(rad.image),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3),
                            BlendMode.darken,
                          )),
                    )
                    .border(
                      color: Colors.black,
                      width: 5.0,
                    )
                    .withRounded(value: 60.0)
                    .make()
                    .onInkDoubleTap(() {
                  playMusic(rad.url);
                }).p16();
              } else {
                return Container();
              }
            }),
          ).centered(),
          Align(
              alignment: Alignment.bottomCenter,
              child: Icon(
                _isPlaying
                    ? CupertinoIcons.stop_circle
                    : CupertinoIcons.play_circle,
                color: Colors.white,
                size: 50.0,
              ).onInkTap(() {
                if (_isPlaying) {
                  _audioplayer.stop();
                } else {
                  playMusic(radios?.first.url ?? "");
                }
              })).pOnly(bottom: context.percentHeight * 12),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: [
          //     if (_isPlaying)
          //       "Playing Now - ${_selectedradio?.name} FM".text.makeCentered()
          //   ].vStack(),
          // )
        ],
      ),
    );
  }
}
