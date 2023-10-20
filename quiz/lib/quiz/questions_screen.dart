import 'package:flutter/material.dart';
import 'package:quiz/start_menu/text_deco.dart';
import 'package:quiz/button_designe.dart';
import 'package:quiz/data/questions.dart';

const Color lightPink = Color(0xffFBC2EB); //0xffFBC2EB, 0xff591DA9
const Color purple = Color(0xff78A3EB);

class QuestionScreen extends StatefulWidget {
  QuestionScreen(this.onSelectedAnswer, {super.key});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentIndex = 0;

  void answerQuesion(String  selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentIndex];
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
            center: Alignment.bottomRight,
            radius: 2.0,
            colors: [lightPink, purple]),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DecoratedText(
                text: currentQuestion.text,
                color: Colors.white,
                fontSize: 28.0),
            const SizedBox(height: 20),
            ...currentQuestion
                .getShuffledAnswers()
                .map((answer) => AnswerButton(answer, (){answerQuesion(answer);}))
          ],
        ),
      ),
    );
  }
}
