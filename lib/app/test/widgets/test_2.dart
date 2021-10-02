import 'package:e_legion_hackaton/app/test/test_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstTest extends ConsumerWidget {
  const FirstTest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final testData = watch(firstTestProvider);
    final questionNum = watch(questionNumProvider);
    final _answer = watch(pickedAnswer);
    final rightAnswers = watch(rightAnswersProvider);
    final activeTestPage = watch(activeTestPageProvider);

    String _getQuestion() {
      return testData.questions[questionNum.state].questionText;
    }

    List<String> _getAnswers() {
      return testData.questions[questionNum.state].answers;
    }

    void _goOn() {
      if (_answer.state == null) return;
      if (testData.questions[questionNum.state].rightAnswer == _answer.state!.index) {
        rightAnswers.state++;
      }
      if (testData.questions.length-1 > questionNum.state) {
        _answer.state = null;
        questionNum.state++;
      } else {
        activeTestPage.state = 3;
      }
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              testData.questionPackName,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
            Padding(padding: EdgeInsets.only(top: 50)),
            Text(
              _getQuestion(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            Padding(padding: EdgeInsets.only(top: 18)),
            ListTile(
              title: Text(
                _getAnswers()[0],
                style: TextStyle(fontSize: 18),
              ),
              leading: Transform.scale(
                scale: 1.3,
                child: Radio<Radios>(
                  value: Radios.a,
                  groupValue: _answer.state,
                  onChanged: (value) {
                    _answer.state = value!;
                  },
                ),
              ),
            ),
            ListTile(
              title: Text(
                _getAnswers()[1],
                style: TextStyle(fontSize: 18),
              ),
              leading: Transform.scale(
                scale: 1.3,
                child: Radio<Radios>(
                  value: Radios.b,
                  groupValue: _answer.state,
                  onChanged: (value) {
                    _answer.state = value!;
                  },
                ),
              ),
            ),
            ListTile(
              title: Text(
                _getAnswers()[2],
                style: TextStyle(fontSize: 18),
              ),
              leading: Transform.scale(
                scale: 1.3,
                child: Radio<Radios>(
                  value: Radios.c,
                  groupValue: _answer.state,
                  onChanged: (value) {
                    _answer.state = value!;
                  },
                ),
              ),
            ),
            ListTile(
              title: Text(
                _getAnswers()[3],
                style: TextStyle(fontSize: 18),
              ),
              leading: Transform.scale(
                scale: 1.3,
                child: Radio<Radios>(
                  value: Radios.d,
                  groupValue: _answer.state,
                  onChanged: (value) {
                    _answer.state = value!;
                  },
                ),
              ),
            ),
            Spacer(),
            Center(
                child: OutlinedButton(
              onPressed: _goOn,
              child: Text(
                (testData.questions.length != questionNum.state)
                    ? 'Продолжить'
                    : 'Закончить',
                style: TextStyle(fontSize: 20),
              ),
            )),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
