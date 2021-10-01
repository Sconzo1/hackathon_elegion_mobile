import 'package:e_legion_hackaton/app/todo/todo_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Filters extends ConsumerWidget {
  const Filters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final firstFilter = watch(firstFilterProvider);
    final secondFilter = watch(secondFilterProvider);
    final thirdFilter = watch(thirdFilterProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FilterChip(
          selected: firstFilter.state,
          backgroundColor: Colors.red[50],
          selectedColor: Colors.red[100],
          checkmarkColor: Colors.red,
          shape: StadiumBorder(side: BorderSide(color: Colors.red[700]!)),
          label: Text(
            'Срочно',
            style: TextStyle(fontSize: 16, color: Colors.red[900]),
          ),
          onSelected: (bool value) {
            firstFilter.state = value;
          },
        ),
        FilterChip(
          selected: secondFilter.state,
          backgroundColor: Colors.yellow[50],
          selectedColor: Colors.yellow[100],
          checkmarkColor: Colors.yellow,
          shape: StadiumBorder(side: BorderSide(color: Colors.yellow[800]!)),
          label: Text(
            'Поторопись',
            style: TextStyle(fontSize: 16, color: Colors.yellow[900]),
          ),
          onSelected: (bool value) {
            secondFilter.state = value;
          },
        ),
        FilterChip(
          selected: thirdFilter.state,
          backgroundColor: Colors.green[50],
          selectedColor: Colors.green[100],
          checkmarkColor: Colors.green,
          shape: StadiumBorder(side: BorderSide(color: Colors.green[700]!)),
          label: Text(
            'Время есть',
            style: TextStyle(fontSize: 16, color: Colors.green[900]),
          ),
          onSelected: (bool value) {
            thirdFilter.state = value;
          },
        ),
      ],
    );
  }
}
