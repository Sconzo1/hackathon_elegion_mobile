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

    List<Todo> getTodosList() {
      var progressTodosList = <Todo>[];
      var doneTodosList = <Todo>[];
      for (var i = 0; i < todosList.length; i++) {
        if (todosList[i].isDone) {
          doneTodosList.add(todosList[i]);
        } else {
          progressTodosList.add(todosList[i]);
        }
      }
      for (var i = 0; i < doneTodosList.length; i++) {
        progressTodosList.add(doneTodosList[i]);
      }
      return progressTodosList;
    }

    return SafeArea(
      child: Column(
        children: [
          Filters(),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: getTodosList().length,
              itemBuilder: (context, index) {
                if (getTodosList()[index].todoFilter == 1 && !firstFilter.state)
                  return Container();
                if (getTodosList()[index].todoFilter == 2 && !secondFilter.state)
                  return Container();
                if (getTodosList()[index].todoFilter == 3 && !thirdFilter.state)
                  return Container();
                return TodoListTile(todo: getTodosList()[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
