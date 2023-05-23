import 'package:flutter/material.dart';
import 'package:project_1/domain/meme_controller.dart';
import 'package:project_1/domain/models/meme.dart';
import 'package:project_1/locator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Meme? visibleMeme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('getIt dependency Injection'),
        backgroundColor: Colors.green,
      ),
      body: Container(
          child: visibleMeme != null
              ? Center(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(children: [
                        Text("category ${visibleMeme!.category}"),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Image.network(visibleMeme!.imageUrl),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text('Caption: ${visibleMeme!.caption}'),
                      ]),
                    ),
                  ),
                )
              : const Center(
                  child: Text('No meme loaded yet'),
                )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Meme meme = await locator.get<MemeDomainController>().getNextMeme();
          setState(() {
            visibleMeme = meme;
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
