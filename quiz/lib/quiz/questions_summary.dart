import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

 Widget Tekstik(Map<String, Object> data, bool greenOrRed) {

    return Text(
      data['user_answer'] as String,
      style: TextStyle(
        color: greenOrRed ? Color.fromARGB(255, 20, 245, 0) : const Color.fromARGB(255, 255, 4, 0),
        fontFamily: 'Nunito',
      ),
    );
  
}

List<bool> getColorList(List<Map<String, Object>> list) {
  List<bool> logicList = [];
  for (int i = 0; i < list.length; i++) {
    logicList.add(list[i]['user_answer'] == list[i]['correct_one']);
  }
  return logicList;
}

@override
Widget build(BuildContext context) {
  final colorList = getColorList(summaryData);

  return SizedBox(
    height: 300,
    width: 350,
    child: SingleChildScrollView(
      child: Column(
        children: summaryData.asMap().entries.map((entry) {
          final index = entry.key;
          final data = entry.value;
          final isAnswerCorrect = colorList[index];

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xff7c94b6),
                ),
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                alignment: Alignment.center,
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['question'] as String,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      data['correct_one'] as String,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 15,
                        color: Color.fromARGB(255, 20, 245, 0),
                      ),
                    ),
                    Tekstik(data, isAnswerCorrect),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ),
    ),
  );
}}