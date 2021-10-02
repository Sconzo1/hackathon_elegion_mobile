import 'package:flutter/material.dart';

class TestOne extends StatefulWidget {
  const TestOne({Key? key}) : super(key: key);

  @override
  _TestOneState createState() => _TestOneState();
}

class _TestOneState extends State<TestOne> {
  int questionNum = 1;

  Widget _getQuestion(String question, List<String> answers, int rightAnswer) {
    return Column(
      children: [
        Text('$question'),
        Text('ans ${answers[0]}'),
        Text('ans ${answers[1]}'),
        Text('ans ${answers[2]}'),
        Text('ans ${answers[3]}'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          _getQuestion('Вопрос $questionNum', ['a1', 'a2', 'a3', 'a4'], 2),
          OutlinedButton(
            onPressed: () {
              setState(() {
                if (questionNum < 10) {
                  questionNum++;
                } else {
                  questionNum = 0;
                }
              });
            },
            child: Text('Dalee'),
          ),
        ],
      ),
    );
  }
}
