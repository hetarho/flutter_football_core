import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({
    super.key,
    required this.onPressed,
    this.disabled = false,
  });

  final void Function() onPressed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: disabled ? Colors.grey[100] : Colors.green[100],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: disabled ? null : onPressed,
        icon: Icon(
          Icons.check,
          color: disabled ? Colors.grey[600] : Colors.green[600],
        ),
      ),
    );
  }
}
