
import 'package:e_legion_hackaton/app/test/test_providers.dart';
import 'package:e_legion_hackaton/data/fake_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestQuestionPacks extends ConsumerWidget{


  @override
  Widget build(BuildContext context, ScopedReader watch) {

    final questionPack = watch(questionPackProvider);
    final questionPackChosen = watch(questionPackChosenProvider);


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Тесты",
                  style:
                  TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: questionPacks.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.folder_open_outlined),
                    title: Text(questionPacks[index].questionPackName),
                    onTap: () => {
                      questionPack.state = questionPacks[index],
                      questionPackChosen.state = true
                    },
                  );
                }),
          )
        ],
      ),
    );
  }


}