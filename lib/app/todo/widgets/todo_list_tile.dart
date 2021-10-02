import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:e_legion_hackaton/data/todo.dart';
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          '${todo.name}',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: todo.isDone
                                  ? FontWeight.w200
                                  : FontWeight.normal),
                          maxLines: 1,
                          minFontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        child: AutoSizeText.rich(
                          TextSpan(
                              text: todo.isDone ? 'Выполнено!' : '',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                              children: [
                                if (!todo.isDone)
                                  TextSpan(
                                    text: 'Выполнить до ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  ),
                                if (!todo.isDone)
                                  TextSpan(
                                    text:
                                        '${MyDateTime(todo.deadline).toString()}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                              ]),
                          maxLines: 1,
                        ),
                      ),
                      Expanded(
                        child: AutoSizeText.rich(
                          TextSpan(
                              text: 'От: ',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: todo.isDone
                                      ? FontWeight.w200
                                      : FontWeight.normal),
                              children: [
                                TextSpan(
                                  text: '${todo.todoOwner}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: todo.isDone
                                          ? FontWeight.w200
                                          : FontWeight.w500),
                                )
                              ]),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //todo.isDone ? Text('*труп*') : Text('монстр'),
                      !todo.isDone
                          ? Image.asset(
                              'assets/monster_lvl${todo.todoWeight}.png',
                              scale: 0.85,
                            )
                          : ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return RadialGradient(
                                  center: Alignment.center,
                                  radius: 0.9,
                                  colors: <Color>[
                                    Colors.white12,
                                    Colors.black26
                                  ],
                                  tileMode: TileMode.mirror,
                                ).createShader(bounds);
                              },
                              child: Image.asset(
                                'assets/monster_lvl${todo.todoWeight}.png',
                                scale: 0.85,
                              ),
                            ),
                      (todo.isDone)
                          ? Text(
                              '+${todo.todoWeight * 25} EXP',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          : Text(
                              '${todo.getMonsterName()}',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
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
