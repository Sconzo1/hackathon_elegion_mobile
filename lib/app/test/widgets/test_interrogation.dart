import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../test_providers.dart';

class TestInterrogation extends ConsumerWidget {
  final pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w400),
    bodyTextStyle: TextStyle(fontSize: 18.0),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,
  );

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final questionPack = watch(questionPackProvider);
    final questionPackChosen = watch(questionPackChosenProvider);
    // final questionCheckboxListTile = watch(questionCheckboxListTileProvider);
    var states = [];

    for( var i= 0; i < questionPack.state.questions.length; i ++){
      states.add([]);
      for( var j =0; j < questionPack.state.questions[i].answers.length; j++){
        final questionCheckboxListTileProvider = StateProvider((ref) => false);
        states[i].add(watch(questionCheckboxListTileProvider));
      }
    }

    List<PageViewModel> _getPageViewModels() {

      return questionPack.state.questions
          .mapIndexed(
            (question, questionIndex) => PageViewModel(
                title: question.questionText,
                bodyWidget: Column(
                  children: [
                    SizedBox(
                      height: 500,
                      child: ListView.builder(
                        itemCount: question.answers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CheckboxListTile(
                            title: Text(question.answers[index]),
                            value: states[questionIndex][index].state,
                            onChanged: (bool? value) {
                              print("Value: $value");
                              print("State: ${states[questionIndex][index].state}");
                              states[questionIndex][index].state = value;
                              print("State: ${states[questionIndex][index].state}");
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                decoration: pageDecoration),
          )
          .toList();
    }

    void _onIntroEnd(context) {
      questionPackChosen.state = false;
    }

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: _getPageViewModels(),
      dotsFlex: 2,
      onDone: () => _onIntroEnd(context),
      done: const Text('Выйти!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      showSkipButton: true,
      skip: const Text(
        'Итог',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      next: const Icon(Icons.arrow_forward),
    );
  }
}


extension ExtendedIterable<E> on Iterable<E> {
  /// Like Iterable<T>.map but the callback has index as second argument
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }

  void forEachIndexed(void Function(E e, int i) f) {
    var i = 0;
    forEach((e) => f(e, i++));
  }
}