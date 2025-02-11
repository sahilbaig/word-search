import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_search/providers/board_provider.dart';

class MyButton extends ConsumerWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        print(ref.read(boardProvider.notifier).foundWords);
      },
      child: const Text("See found words"),
    );
  }
}
