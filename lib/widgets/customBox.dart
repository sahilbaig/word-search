import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_search/providers/board_provider.dart';
import 'package:word_search/providers/pointer_provider.dart';

class Custombox extends ConsumerStatefulWidget {
  final String letter;
  final String keyValue; // Adding an index to uniquely identify each box
  const Custombox({super.key, required this.letter, required this.keyValue});

  @override
  ConsumerState<Custombox> createState() => _CustomboxState();
}

class _CustomboxState extends ConsumerState<Custombox> {
  bool isHovered = false;
  bool boardState = false;

  // This function checks if the pointer is hovering over the box
  void checkHover(Offset pointer) {
    final RenderBox? box = context.findRenderObject() as RenderBox?;
    final Offset? position = box?.localToGlobal(Offset.zero);
    const double size = 50;

    final board = ref.read(boardProvider.notifier);
    if (position != null) {
      bool hovered = pointer.dx >= position.dx &&
          pointer.dx <= position.dx + size &&
          pointer.dy >= position.dy &&
          pointer.dy <= position.dy + size;

      if (hovered) {
        setState(() {
          isHovered = true;
        });
        // Avoid modifying provider inside build, so schedule the update
        WidgetsBinding.instance.addPostFrameCallback((_) {
          board.addWidgetKey(widget.keyValue, widget.letter);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Offset pointer = ref.watch(pointerProvider);
    final BoardState = ref.watch(boardProvider).contains(widget.keyValue);
    checkHover(pointer); // Checking for hover on each frame
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: BoardState ? Colors.red : Colors.blue,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Center(
        child: Text(
          widget.letter,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
