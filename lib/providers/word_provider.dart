import 'dart:core';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class WordProvider extends Notifier<String> {
  @override
  String build() {
    return "";
  }

  void addToUserTypedWord(String char) {
    state += char;
  }

  void resetWord() {
    state = "";
  }
}

final wordProvider = NotifierProvider<WordProvider, String>(WordProvider.new);
