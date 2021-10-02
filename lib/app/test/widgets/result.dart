import 'package:e_legion_hackaton/app/test/test_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class TestResult extends ConsumerWidget {
  const TestResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final testData = watch(firstTestProvider);
    final questionNum = watch(questionNumProvider);
    final _answer = watch(pickedAnswer);
    final rightAnswers = watch(rightAnswersProvider);
    final activeTestPage = watch(activeTestPageProvider);

    String _getResult() {
      return 'Правильных ответов: ${rightAnswers.state} / ${testData.questions.length}';
    }

    void _goBack() async {
      questionNum.state = 0;
      rightAnswers.state = 0;
      _answer.state = null;

      const url = 'https://elegion-hack.herokuapp.com/api/user_tasks/1/';
      await http.patch(
        Uri.parse(url),
        body: {
          "is_done": true,
        },
      );

      activeTestPage.state = 1;
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Результат',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
            Padding(padding: EdgeInsets.only(top: 50)),
            Center(
              child: Text(
                _getResult(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 18)),
            Center(
              child: Text(
                'Вы молодец!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
            ),
            Spacer(),
            Center(
                child: OutlinedButton(
              onPressed: _goBack,
              child: Text(
                'Вернуться',
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
