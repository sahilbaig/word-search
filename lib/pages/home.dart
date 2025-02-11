import 'package:flutter/material.dart';
import 'package:word_search/providers/board_provider.dart';
import 'package:word_search/providers/pointer_provider.dart';
import 'package:word_search/widgets/board.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_search/widgets/customButton.dart';
import 'package:word_search/widgets/resetButton.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            GestureDetector(
                onPanStart: (details) {},
                onPanUpdate: (details) => {
                      ref
                          .read(pointerProvider.notifier)
                          .updateLocation(details.globalPosition)
                    },
                onPanEnd: (details) {
                  ref
                      .read(pointerProvider.notifier)
                      .updateLocation(Offset(0, 0));

                  print(ref.read(boardProvider.notifier).checkWord());
                },
                child: Board()),
            MyButton(),
            Resetbutton()
          ],
        ),
      ),
    );
  }
}
