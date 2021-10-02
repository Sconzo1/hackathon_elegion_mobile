import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../guides_providers.dart';

class GuideFilters extends ConsumerWidget {
  const GuideFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final firstGuideFilter = watch(firstGuideFilterProvider);
    final secondGuideFilter = watch(secondGuideFilterProvider);
    final thirdGuideFilter = watch(thirdGuideFilterProvider);
    final fourthGuideFilter = watch(fourthGuideFilterProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Wrap(
        spacing: 16.0,
        runSpacing: 0.0,
        alignment: WrapAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: FilterChip(
              selected: firstGuideFilter.state,
              backgroundColor: Colors.red[50],
              selectedColor: Colors.red[100],
              checkmarkColor: Colors.red,
              label: Text('Прогаммирование', style: TextStyle(fontSize: 16, color: Colors.red[900] )),
              onSelected: (bool value){
                firstGuideFilter.state = value;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: FilterChip(
              selected: secondGuideFilter.state,
              backgroundColor: Colors.purple[50],
              selectedColor: Colors.purple[100],
              checkmarkColor: Colors.purple,
              label: Text(
                'Статьи',
                style: TextStyle(fontSize: 16, color: Colors.purple[900]),
              ),
              onSelected: (bool value) {
                secondGuideFilter.state = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: FilterChip(
              selected: thirdGuideFilter.state,
              backgroundColor: Colors.yellow[50],
              selectedColor: Colors.yellow[100],
              checkmarkColor: Colors.yellow,
              label: Text(
                'How Tobe',
                style: TextStyle(fontSize: 16, color: Colors.yellow[900]),
              ),
              onSelected: (bool value) {
                thirdGuideFilter.state = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: FilterChip(
              selected: fourthGuideFilter.state,
              backgroundColor: Colors.green[50],
              selectedColor: Colors.green[100],
              checkmarkColor: Colors.green,
              label: Text(
                'Непрограммирование',
                style: TextStyle(fontSize: 16, color: Colors.green[900]),
              ),
              onSelected: (bool value) {
                fourthGuideFilter.state = value;
              },
            ),
          ),
        ],
      ),
    );
  }

}


