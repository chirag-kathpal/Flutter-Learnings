class Item {
  final int id;
  final String name;
  final String description;
  final int price;
  final String color;
  final String imageUrl;

  Item(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.color,
      required this.imageUrl});

  factory Item.fromJson(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      description: map['desc'],
      price: map['price'],
      color: map['color'],
      imageUrl: map['image'],
    );
  }

  toMap() => {
        'id': id,
        'name': name,
        'desc': description,
        'price': price,
        'color': color,
        'image': imageUrl,
      };
}

class CatalogModels {
  static List<Item>? items;
  /*= [
    Item(
        id: 1,
        color: '#33505a',
        imageUrl:
            'https://www.telstra.com.au/content/dam/tcom/lego/2020/plans-devices/mobiles/google-pixel-5/shared-google-pixel-5-black-05-900x1200.png',
        price: 999,
        description: "iphone",
        name: '12pro'),
  ];*/
}
