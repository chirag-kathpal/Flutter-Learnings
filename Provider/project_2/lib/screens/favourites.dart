import 'package:flutter/material.dart';
import 'package:project_2/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context);
    final words = provider.words;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites Items'),
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
                    : const Icon(Icons.favorite_border)),
          );
        }),
        itemCount: words.length,
      ),
    );
  }
}
