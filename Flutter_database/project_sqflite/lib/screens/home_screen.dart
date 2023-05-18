import 'package:flutter/material.dart';
import 'package:project_sqflite/database/db_handler.dart';
import 'package:project_sqflite/models/notes_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DBhelper? dBhelper;
  late Future<List<NotesModel>> notesList;

  @override
  void initState() {
    super.initState();
    dBhelper = DBhelper();
    loadData();
  }

  loadData() {
    notesList = dBhelper!.getNotesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: notesList,
                builder: (context, AsyncSnapshot<List<NotesModel>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((context, index) {
                          return Dismissible(
                            key: ValueKey<int>(snapshot.data![index].id!),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              color: Colors.red,
                              child: Icon(Icons.delete_forever),
                            ),
                            onDismissed: (DismissDirection direction) {
                              setState(() {
                                dBhelper!.delete(snapshot.data![index].id!);
                                notesList = dBhelper!.getNotesList();
                                snapshot.data!.remove(snapshot.data![index]);
                              });
                            },
                            child: Card(
                                child: ListTile(
                              contentPadding: EdgeInsets.all(0),
                              title:
                                  Text(snapshot.data![index].title.toString()),
                              subtitle: Text(
                                  snapshot.data![index].description.toString()),
                              trailing:
                                  Text(snapshot.data![index].age.toString()),
                            )),
                          );
                        }));
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dBhelper!
              .insert(NotesModel(
                  title: 'FirstNote',
                  age: 22,
                  description: 'First sqfLite App',
                  email: 'chirg.k@cumulations.com'))
              .then((value) {
            print('Data added');
            setState(() {
              notesList = dBhelper!.getNotesList();
            });
          }).onError((error, stackTrace) {
            print(error.toString());
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
