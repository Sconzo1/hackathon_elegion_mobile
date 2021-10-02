import 'package:e_legion_hackaton/app/todo/todo_providers.dart';
import 'package:e_legion_hackaton/app/todo/widgets/filter_chips.dart';
import 'package:e_legion_hackaton/app/todo/widgets/todo_list_tile.dart';
import 'package:e_legion_hackaton/app/top_level_providers.dart';
import 'package:e_legion_hackaton/widgets/bottom_navigation_bar.dart';
import 'package:e_legion_hackaton/widgets/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final todosList = watch(todosListProvider);
    final firstFilter = watch(firstFilterProvider);
    final secondFilter = watch(secondFilterProvider);
    final thirdFilter = watch(thirdFilterProvider);
    final fourthFilter = watch(fourthFilterProvider);

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 12, left: 12)),
          Center(
            child: Text(
              'Фильтры:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Filters(),
          ),
          todosList.when(
            loading: () => Center(child: CircularProgressIndicator()),
            error: (error, st) => Center(child: Text('Error: $error')),
            data: (data) => Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  if (data[index].todoFilter == 1 && !firstFilter.state)
                    return Container();
                  if (data[index].todoFilter == 2 && !secondFilter.state)
                    return Container();
                  if (data[index].todoFilter == 3 && !thirdFilter.state)
                    return Container();
                  if (data[index].isDone && !fourthFilter.state)
                    return Container();
                  return TodoListTile(todo: data[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
