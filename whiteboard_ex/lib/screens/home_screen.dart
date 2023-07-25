import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whiteboard/whiteboard.dart';
import 'package:whiteboard_ex/screens/custom_floating_button.dart';
import 'package:whiteboard_ex/utils/common.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late WhiteBoardController _controller;
  late Color pickerColor = Colors.blue;
  bool expandTool = false;
  bool showBottomList = false;

  @override
  void initState() {
    _controller = WhiteBoardController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: const Text(
          'WhiteBoard',
        ),
        actions: [
          IconButton(
            onPressed: () {
              _controller.convertToImage();
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                  child: WhiteBoard(
                    controller: _controller,
                    strokeColor: selectedColor,
                    strokeWidth: strokeWidth,
                    onConvertImage: (Uint8List imageList) async {
                      await FileSaver.instance
                          .saveAs("savedImage", imageList, 'png', MimeType.PNG);
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5, right: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Visibility(
                            visible: expandTool,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomFActionButton(
                                  icon: Icon(FontAwesomeIcons.pen),
                                  tag: 0,
                                  function: () {
                                    setState(() {
                                      selectedColor = Colors.black;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                CustomFActionButton(
                                  icon: Icon(FontAwesomeIcons.rotateLeft),
                                  tag: 1,
                                  function: _controller.undo,
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                CustomFActionButton(
                                  tag: 2,
                                  function: _controller.redo,
                                  icon: const Icon(
                                      FontAwesomeIcons.arrowRotateRight),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                CustomFActionButton(
                                  icon: Icon(FontAwesomeIcons.eraser),
                                  tag: 3,
                                  function: () {
                                    setState(() {
                                      selectedColor = Colors.white;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    Visibility(
                                      visible: showBottomList,
                                      child: Slider(
                                          value: strokeWidth,
                                          max: 50.0,
                                          min: 0.0,
                                          onChanged: (val) {
                                            setState(() {
                                              strokeWidth = val;
                                            });
                                          }),
                                    ),
                                    CustomFActionButton(
                                      tag: 4,
                                      function: () {
                                        setState(() {
                                          showBottomList = !showBottomList;
                                        });
                                      },
                                      icon: const Icon(FontAwesomeIcons
                                          .upRightAndDownLeftFromCenter),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                CustomFActionButton(
                                  tag: 5,
                                  function: () {
                                    showColorPacker(context);
                                  },
                                  icon: const Icon(FontAwesomeIcons.palette),
                                ),
                                const SizedBox(height: 2),
                                CustomFActionButton(
                                  tag: 6,
                                  function: _controller.clear,
                                  icon: const Icon(FontAwesomeIcons.trash),
                                ),
                              ],
                            ),
                          ),
                          CustomFActionButton(
                            tag: 7,
                            function: () {
                              setState(() {
                                expandTool = !expandTool;
                              });
                            },
                            icon: const Icon(FontAwesomeIcons.penToSquare),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> showColorPacker(BuildContext context) {
    return showDialog(
      builder: (context) => AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: (color) {
              pickerColor = color;
            },
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Got it'),
            onPressed: () {
              setState(() => selectedColor = pickerColor);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      context: context,
    );
  }
}
