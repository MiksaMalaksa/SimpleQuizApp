import 'package:flutter/material.dart';
import 'package:quiz/start_menu/main_menu_container.dart';
import 'package:quiz/quiz/questions_screen.dart';
import 'package:quiz/quiz/result.dart';

import '../data/questions.dart';

class Quiz extends StatefulWidget {
  Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  final List<String> selectedAnswers = [];
  Widget? activeScreen;

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(chosenOnes: selectedAnswers, onRestart: RestartQuiz,);
      });
    }
  }

 void RestartQuiz(){
  setState(() {
    selectedAnswers.clear();
    activeScreen = Quiz();
  });
 }

  @override
  void initState() {
    super.initState();
    activeScreen = MainMenuContainer(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(chooseAnswer);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(body: activeScreen),
    );
  }
}
