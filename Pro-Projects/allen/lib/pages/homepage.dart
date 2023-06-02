import 'package:allen/services/open_ai_service.dart';
import 'package:allen/utils/pallete.dart';
import 'package:allen/widgets/feature_box.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final speechToText = SpeechToText();
  final flutterTts = FlutterTts();

  String lastWords = '';
  final OpenAIService openaiservice = OpenAIService();

  String? generatedContent;
  String? generatedImageUrl;

  @override
  void initState() {
    super.initState();
    initSpeechToText();

    // for text to speech tts
    // initTextToSpeech();
  }

// ios only implementation
  // Future<void> initTextToSpeech() async {
  //   await flutterTts.setSharedInstance(true);
  //   setState(() {});
  // }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  // Future<void> systemSpeak(String content) async {
  //   await flutterTts.speak(content);
  // }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BounceInDown(
          child: const Text('Allen'),
        ),
        leading: const Icon(Icons.menu),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ZoomIn(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      margin: const EdgeInsets.only(top: 4.0),
                      decoration: const BoxDecoration(
                        color: Pallete.assistantCircleColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Container(
                    height: 123,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/virtualAssistant.png'))),
                  )
                ],
              ),
            ),

            // chat bubble
            FadeInRight(
              child: Visibility(
                visible: generatedImageUrl == null,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ).copyWith(
                    top: 30,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Pallete.borderColor,
                    ),
                    borderRadius: BorderRadius.circular(20).copyWith(
                      topLeft: Radius.zero,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      generatedContent == null
                          ? 'Good Morning, What task can I do for you?'
                          : generatedContent!,
                      style: TextStyle(
                        fontFamily: 'Cera Pro',
                        color: Pallete.mainFontColor,
                        fontSize: generatedContent == null ? 24 : 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            if (generatedImageUrl != null)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(generatedImageUrl!),
                ),
              ),

            SlideInLeft(
              child: Visibility(
                visible: generatedContent == null && generatedImageUrl == null,
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 10.0,
                    left: 22,
                  ),
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Here are a few Features',
                    style: TextStyle(
                      fontFamily: 'Cera Pro',
                      color: Pallete.mainFontColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            // features list
            Visibility(
              visible: generatedContent == null && generatedImageUrl == null,
              child: const Column(
                children: [
                  FeatureBox(
                    color: Pallete.firstSuggestionBoxColor,
                    headerText: 'ChatGpt',
                    desc:
                        'A smarter way to stay organized and informed with ChatGpt',
                  ),
                  FeatureBox(
                    color: Pallete.secondSuggestionBoxColor,
                    headerText: 'Dall-E',
                    desc:
                        'Get inspired and Stay creative with your personal assistant powered by Dall-E',
                  ),
                  FeatureBox(
                    color: Pallete.thirdSuggestionBoxColor,
                    headerText: 'Smart voice Assistant',
                    desc:
                        'Get the Best of both worlds with a voice assistant powered by Dall-E and ChatGpt',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ZoomIn(
        child: FloatingActionButton(
          backgroundColor: Pallete.firstSuggestionBoxColor,
          onPressed: () async {
            if (await speechToText.hasPermission &&
                speechToText.isNotListening) {
              await startListening();
            } else if (speechToText.isListening) {
              final speech = await openaiservice.isArtPromptAPI(lastWords);
              if (speech.contains('https')) {
                generatedImageUrl = speech;
                generatedContent = null;
                setState(() {});
              } else {
                generatedImageUrl = null;
                generatedContent = speech;
                // await systemSpeak(speech);
                setState(() {});
              }
              await stopListening();
            } else {
              initSpeechToText();
            }
          },
          child: Icon(
            speechToText.isListening ? Icons.stop : Icons.mic,
          ),
        ),
      ),
    );
  }
}
