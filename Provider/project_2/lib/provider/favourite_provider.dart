import 'package:flutter/material.dart';

class FavouriteProvider extends ChangeNotifier {
  List<String> _words = [];
  List<String> get words => _words;

  void toogleFavourite(String word) {
    final isExist = _words.contains(word);
    if (isExist) {
      _words.remove(word);
    } else {
      _words.add(word);
    }
    notifyListeners();
  }

  void clearFavourite() {
    _words = [];
    notifyListeners();
  }

  bool isExist(String word) {
    final isExist = _words.contains(word);
    return isExist;
  }
}
