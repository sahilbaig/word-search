import 'package:flutter/material.dart';
import 'package:word_search/widgets/customBox.dart';

class Board extends StatelessWidget {
  const Board({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        3,
        (row) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (col) => Custombox(
              letter: ["B", "O", "O", "K", "S"][col],
              keyValue: ('$row-$col'),
            ),
          ),
        ),
      ),
    );
  }
}
