import 'package:flutter/material.dart';
import 'package:word_search/widgets/customBox.dart';

class Board extends StatelessWidget {
  Board({super.key});

  final boardLetters = [
    ["N", "A", "N", "O", "O", "M"],
    ["A", "N", "M", "A", "P", "U"],
    ["T", "I", "K", "R", "A", "P"],
    ["U", "M", "E", "R", "I", "F"],
    ["R", "A", "E", "K", "A", "L"],
    ["E", "L", "E", "U", "I", "U"],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        boardLetters.length,
        (row) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            boardLetters[row].length,
            (col) => Custombox(
              letter: boardLetters[row][col],
              keyValue: '$row-$col',
            ),
          ),
        ),
      ),
    );
  }
}
