import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardProvider extends Notifier<List<String>> {
  @override
  List<String> build() {
    return [];
  }

  static final wordsToFind = [
    "ANIMAL",
    "FIRE",
    "LAKE",
    "MAP",
    "MOON",
    "NATURE",
    "PARK"
  ];

  String userTypedWord = "";

  List<List<String>> foundWords = [];

  void addWidgetKey(String key, String letter) {
    if (!state.contains(key)) {
      state = [...state, key];
      userTypedWord += letter;
    }
  }

  bool checkWord() {
    if (wordsToFind.contains(userTypedWord)) {
      foundWords.add(state);
      return true;
    }
    return false;
  }

  // Reset the list of widget keys.
  void resetBoard() {
    state = [];
    userTypedWord = "";
  }
}

final boardProvider =
    NotifierProvider<BoardProvider, List<String>>(BoardProvider.new);
