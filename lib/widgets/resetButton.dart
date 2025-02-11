import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_search/providers/board_provider.dart';

class Resetbutton extends ConsumerWidget {
  const Resetbutton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        onPressed: () {
          ref
              .read(boardProvider.notifier)
              .resetBoard(); // Call resetBoard method
          print("Resetting Board: ${ref.read(boardProvider)}");
        },
        child: Text("Reset "));
  }
}
