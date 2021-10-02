import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../test_providers.dart';

// class TestInterrogation extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     final questionPack = watch(questionPackProvider);
//     final questionPackChosen = watch(questionPackChosenProvider);
//     final checkboxes = watch(answersCheckboxesProvider);
//
//     void _onIntroEnd(context) {
//       questionPackChosen.state = false;
//     }
//
//     return IntroductionScreen(
//       globalBackgroundColor: Colors.white,
//       pages: _getPageViewModels(),
//       dotsFlex: 2,
//       onDone: () => _onIntroEnd(context),
//       done: const Text('Выйти!',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//       showSkipButton: true,
//       skip: const Text(
//         'Итог',
//         style: TextStyle(
//           fontSize: 18,
//         ),
//       ),
//       next: const Icon(Icons.arrow_forward),
//     );
//   }
// }

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

class NewTestInterrogation extends StatefulWidget {
  NewTestInterrogation(
      {Key? key,
      required this.questionPack,
      required this.isQuestionPackChosen})
      : super(key: key);

  final questionPack;
  var isQuestionPackChosen;

  @override
  _NewTestInterrogationState createState() => _NewTestInterrogationState();
}

class _NewTestInterrogationState extends State<NewTestInterrogation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int questionNum = 1;
  List<bool> checkboxes = List.generate(4, (index) => false);

  List<PageViewModel> _getPageViewModels() {
    var temp = <PageViewModel>[];

    for (int i = 0; i < widget.questionPack.questions.length; i++) {
      temp.add(
        PageViewModel(
          title: widget.questionPack.questions[i].question.questionText,
          bodyWidget: Column(
            children: [
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: widget.questionPack.questions[i].question.answers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CheckboxListTile(
                      title:
                          Text(widget.questionPack.questions[i].question.answers[index]),
                      value: checkboxes[index],
                      onChanged: (bool? value) {
                        setState(() {
                          var temp = checkboxes;
                          temp[index] = value!;
                          checkboxes = temp;
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          decoration: const PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 28.0, fontWeight: FontWeight.w400),
            bodyTextStyle: TextStyle(fontSize: 18.0),
            descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            pageColor: Colors.white,
            imagePadding: EdgeInsets.zero,
          ),
        ),
      );
    }

    return temp;
  }

  void _onIntroEnd(context) {
    widget.isQuestionPackChosen = false;
  }

  @override
  Widget build(BuildContext context) {
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
