import 'package:ai_radio/model/radio.dart';
import 'package:ai_radio/utils/ai_util.dart';
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

  @override
  void initState() {
    super.initState();
    fetchRadios();
  }

  fetchRadios() async {
    final radioJson = await rootBundle.loadString("assets/radio.json");
    setState(() {
      radios = MyRadioList.fromJson(radioJson).radios;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('AI Radio'),
      //   backgroundColor: Colors.transparent,
      // ),
      drawer: const Drawer(),
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
          ).p(22),
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
                      Align(
                          alignment: Alignment.center,
                          child: [
                            const Icon(
                              CupertinoIcons.play_circle,
                              color: Colors.white,
                            ),
                            10.heightBox,
                            "Double tap to play".text.gray300.make(),
                          ].vStack())
                    ],
                  ),
                )
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
                    .p16()
                    .centered();
              } else {
                return Container();
              }
            }),
          )
        ],
      ),
    );
  }
}
