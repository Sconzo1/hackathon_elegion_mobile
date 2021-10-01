import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:e_legion_hackaton/services/date_time.dart';
import 'package:flutter/material.dart';

class TodoListTile extends StatelessWidget {
  const TodoListTile({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(200, 239, 240, 246),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: SizedBox(
            height: 80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          '${todo.name}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: todo.isDone ? FontWeight.w200 : FontWeight.normal),
                          maxLines: 2,
                        ),
                      ),
                      Expanded(
                        child: AutoSizeText.rich(
                          TextSpan(text: todo.isDone
                              ? 'Выполнено!'
                              : '',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          children: [
                            if (!todo.isDone) TextSpan(text: 'Выполнить до ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),),
                            if (!todo.isDone) TextSpan(text: '${MyDateTime(todo.deadline).toString()}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                          ]),

                          maxLines: 1,
                        ),
                      ),
                      Expanded(
                        child: AutoSizeText.rich(
                          TextSpan(text: 'От: ',
                              style: TextStyle(fontSize: 16, fontWeight: todo.isDone ? FontWeight.w200 : FontWeight.normal),
                              children: [
                                TextSpan(text: '${todo.todoOwner}', style: TextStyle(fontSize: 16, fontWeight: todo.isDone ? FontWeight.w200 : FontWeight.w500),)
                              ]),

                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      todo.isDone ? Text('*труп*') : Text('монстр'),
                      if (todo.isDone) Text('+${todo.todoWeight * 10} EXP', style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Todo {
  int id;
  String name;
  String description;
  DateTime deadline;
  bool isDone;
  int todoWeight;
  String todoOwner;

  late int todoFilter;

  Todo(
      {required this.id,
      required this.name,
      required this.description,
      required this.deadline,
      required this.isDone,
      required this.todoWeight,
      required this.todoOwner}) {
    if (isDone) {
      todoFilter = -1;
    }
    else if (deadline.difference(DateTime.now()).inDays <= 2) {
      todoFilter = 3;
    } else if (deadline.difference(DateTime.now()).inDays <= 4) {
      todoFilter = 2;
    } else {
      todoFilter = 1;
    }
  }

}
