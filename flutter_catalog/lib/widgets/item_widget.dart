import 'package:flutter/material.dart';

import '../models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print('${item.name} pressed');
        },
        leading: Image.network(item.imageUrl),
        title: Text(item.name),
        subtitle: Text(item.description),
        trailing: Text(
          '\$ ${item.price.toString()}',
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
          textScaleFactor: 1.5,
        ),
      ),
    );
  }
}
