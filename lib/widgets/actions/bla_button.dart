import 'package:flutter/material.dart';

enum BlaButtonType { primary, secondary }

class BlaButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final BlaButtonType type;
  final double? width;
  final double? height;

  const BlaButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.type = BlaButtonType.primary,
    this.width,
    this.height,
  });

  //computed values
  Color get _backgroundColor => type == BlaButtonType.primary ? Colors.blue : Colors.white;
  Color get _foregroundColor => type == BlaButtonType.primary ? Colors.white : Colors.blue;
  Color get _borderColor => type == BlaButtonType.primary ? Colors.blue : Colors.grey;

  @override
  Widget build(BuildContext context) {
    return SizedBox( //SizeBox help determine size of button
      width: width ?? double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed, 
        style: ElevatedButton.styleFrom(
          backgroundColor: _backgroundColor,
          foregroundColor: _foregroundColor,
          side: BorderSide(color: _borderColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 18),
              const SizedBox(width: 8),
            ],
            Text(
              text, 
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              )
            ),
          ],
        )
      ),
    );
  }
}
