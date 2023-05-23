class Meme {
  final int id;
  final String imageUrl;
  final String caption;
  final String category;

  Meme(
      {required this.id,
      required this.caption,
      required this.category,
      required this.imageUrl});

  Meme.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        imageUrl = json['image'],
        caption = json['caption'],
        category = json['category'];
}
