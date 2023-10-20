import 'package:flutter/material.dart';
import 'package:quiz/start_menu/text_deco.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton(this.answerText, this.onTap, {super.key});

  final String answerText;
  final void Function() onTap;

@override
Widget build(BuildContext context) {
  return ElevatedButton(
    onPressed: onTap,
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFF8D4EE)),
      foregroundColor: MaterialStateProperty.all<Color>(Color(0xFFF8D4EE)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(vertical: 10,horizontal: 40), // Adjust the padding value as needed
      ),
    ),
    child: Container(
      color: Color.fromARGB(255, 248, 212, 238),
      height: 20,
      width: 200,
      child: Center(
        child: DecoratedText(
          text: answerText,
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    ),
  );
}
}
