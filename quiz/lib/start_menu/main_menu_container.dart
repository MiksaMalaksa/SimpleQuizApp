import 'package:flutter/material.dart';
import 'package:quiz/start_menu/text_deco.dart';

const Color lightPink = Color(0xffFBC2EB); //0xffFBC2EB, 0xff591DA9
const Color purple = Color(0xff78A3EB); //0xff78A3EB, 0xff051960

class MainMenuContainer extends StatelessWidget {
  const MainMenuContainer(this.startQuiz,
      {this.keyColor = lightPink, this.secondColor = purple, super.key});

  final void Function() startQuiz;
  final Color keyColor;
  final Color secondColor;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
            center: Alignment.bottomRight,
            radius: 2.0,
            colors: [keyColor, secondColor]),
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 150),
          Image.asset(
            'assets/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(230, 255, 255, 255),
          ),
          const SizedBox(height: 30),
          const DecoratedText(
              text: "Learn Flutter with fun!",
              color: Colors.white,
              fontSize: 28.0),
          const SizedBox(height: 20),
          ElevatedButton.icon(
              onPressed: () {
                startQuiz();
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFFF8D4EE)),
              ),
              icon: Icon(Icons.check),
              label: Container(
                color: Color(0xFFF8D4EE),
                height: 20,
                width: 100,
                child: Center(
                  child: DecoratedText(
                      text: "Start Quiz", color: Colors.white, fontSize: 20.0),
                ),
              ))
        ],
      )),
    );
  }
}
