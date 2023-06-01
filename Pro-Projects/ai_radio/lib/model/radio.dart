// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class MyRadioList {
  final List<MyRadio> radios;
  MyRadioList({
    required this.radios,
  });

  MyRadioList copyWith({
    List<MyRadio>? radios,
  }) {
    return MyRadioList(
      radios: radios ?? this.radios,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'radios': radios.map((x) => x.toMap()).toList(),
    };
  }

  factory MyRadioList.fromMap(Map<String, dynamic> map) {
    return MyRadioList(
      radios: List<MyRadio>.from(
        (map['radios'] as List<dynamic>).map<MyRadio>(
          (x) => MyRadio.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MyRadioList.fromJson(String source) =>
      MyRadioList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MyRadioList(radios: $radios)';

  @override
  bool operator ==(covariant MyRadioList other) {
    if (identical(this, other)) return true;

    return listEquals(other.radios, radios);
  }

  @override
  int get hashCode => radios.hashCode;
}

class MyRadio {
  final int id;
  final int order;
  final String name;
  final String tagline;
  final String desc;
  final String url;
  final String category;
  final String lang;
  final String icon;
  final String image;
  final String color;
  MyRadio({
    required this.id,
    required this.order,
    required this.name,
    required this.tagline,
    required this.desc,
    required this.url,
    required this.category,
    required this.lang,
    required this.icon,
    required this.image,
    required this.color,
  });

  MyRadio copyWith({
    int? id,
    int? order,
    String? name,
    String? tagline,
    String? desc,
    String? url,
    String? category,
    String? lang,
    String? icon,
    String? image,
    String? color,
  }) {
    return MyRadio(
      id: id ?? this.id,
      order: order ?? this.order,
      name: name ?? this.name,
      tagline: tagline ?? this.tagline,
      desc: desc ?? this.desc,
      url: url ?? this.url,
      category: category ?? this.category,
      lang: lang ?? this.lang,
      icon: icon ?? this.icon,
      image: image ?? this.image,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order': order,
      'name': name,
      'tagline': tagline,
      'desc': desc,
      'url': url,
      'category': category,
      'lang': lang,
      'icon': icon,
      'image': image,
      'color': color,
    };
  }

  factory MyRadio.fromMap(Map<String, dynamic> map) {
    return MyRadio(
      id: map['id'] as int,
      order: map['order'] as int,
      name: map['name'] as String,
      tagline: map['tagline'] as String,
      desc: map['desc'] as String,
      url: map['url'] as String,
      category: map['category'] as String,
      lang: map['lang'] as String,
      icon: map['icon'] as String,
      image: map['image'] as String,
      color: map['color'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyRadio.fromJson(String source) =>
      MyRadio.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Radio(id: $id, order: $order, name: $name, tagline: $tagline, desc: $desc, url: $url, category: $category, lang: $lang, icon: $icon, image: $image, color: $color)';
  }

  @override
  bool operator ==(covariant MyRadio other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.order == order &&
        other.name == name &&
        other.tagline == tagline &&
        other.desc == desc &&
        other.url == url &&
        other.category == category &&
        other.lang == lang &&
        other.icon == icon &&
        other.image == image &&
        other.color == color;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        order.hashCode ^
        name.hashCode ^
        tagline.hashCode ^
        desc.hashCode ^
        url.hashCode ^
        category.hashCode ^
        lang.hashCode ^
        icon.hashCode ^
        image.hashCode ^
        color.hashCode;
  }
}
