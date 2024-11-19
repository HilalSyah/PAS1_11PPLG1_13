import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final Color colorBg;
  final Color colorBorder;
  final String text;

  const Button(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.colorBg,
      required this.colorBorder});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2, left: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: colorBorder),
      ),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,
        onPressed: onPressed,
        color: colorBg,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
