import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/start_menu/text_deco.dart';
import 'package:quiz/quiz/questions_summary.dart';

const Color lightPink = Color(0xffFBC2EB); //0xffFBC2EB, 0xff591DA9
const Color purple = Color(0xff78A3EB); //0xff78A3EB, 0xff051960

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.chosenOnes, required this.onRestart});

  final List<String> chosenOnes;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenOnes.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_one': questions[i].answers[0],
        'user_answer': chosenOnes[i]
      });
    }
    return summary;
  }

  List<bool> getColorList(List<Map<String, Object>> list){
     List<bool> logicList = [];
     for(int i = 0;i < list.length;i++){
       logicList.add(list[i]['user_answer'] == list[i]['correct_one']);
     }
     return logicList;
  }
  
  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final allQuestions = questions.length;
    final numOfCorrectAnswers = summaryData.where((data) {
      return data['user_answer'] == data['correct_one'];
    }).length;

    return Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
              center: Alignment.bottomRight,
              radius: 2.0,
              colors: [lightPink, purple]),
        ),
        child: SizedBox(
            width: double.infinity,
            child: Container(
              margin: EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DecoratedText(
                      text:
                          "You answered $numOfCorrectAnswers out of $allQuestions questions correcly",
                      color: Colors.white,
                      fontSize: 28),
                  SizedBox(
                    height: 20,
                  ),
                  QuestionsSummary(getSummaryData()),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(onPressed: onRestart, child: const Text("Try again!"))
                ],
              ),
            )));
  }
}
