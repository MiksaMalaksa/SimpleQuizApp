import 'package:flutter/material.dart';


class DecoratedText extends StatelessWidget {
  const DecoratedText({
    required this.text,
    required this.color,
    required this.fontSize,
  });

  final Color color;
  final double fontSize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontFamily: 'Nunito',
        fontSize: fontSize,

      ),
    );
  }
}
