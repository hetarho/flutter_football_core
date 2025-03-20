import 'package:flutter/material.dart';

class FoldableButton extends StatelessWidget {
  const FoldableButton({super.key, required this.onPressed, required this.isFolded});

  final void Function() onPressed;
  final bool isFolded;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.green[100],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          isFolded ? Icons.expand_more : Icons.expand_less,
          color: Colors.green[600],
        ),
      ),
    );
  }
}
