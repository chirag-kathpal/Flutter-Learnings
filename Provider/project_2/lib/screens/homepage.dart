import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:project_2/provider/favourite_provider.dart';
import 'package:project_2/screens/favourites.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final words = nouns.take(50).toList();
    final provider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('English Words'),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          final word = words[index];
          return ListTile(
            title: Text(word),
            trailing: IconButton(
              onPressed: () {
                provider.toogleFavourite(word);
              },
              icon: provider.isExist(word)
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(Icons.favorite_border),
            ),
          );
        }),
        itemCount: words.length,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Favorites'),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FavouritesPage(),
              ));
        },
      ),
    );
  }
}
