import 'dart:convert';

import 'package:e_legion_hackaton/app/todo/widgets/todo_list_tile.dart';
import 'package:e_legion_hackaton/data/fake_data.dart';
import 'package:e_legion_hackaton/data/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final firstFilterProvider = StateProvider((ref) => true);
final secondFilterProvider = StateProvider((ref) => true);
final thirdFilterProvider = StateProvider((ref) => true);
final fourthFilterProvider = StateProvider((ref) => false);

final todosListProvider = FutureProvider<List<Todo>>((ref) async {
  //return Future.delayed(Duration(seconds: 2)).then((value) => fakeTodos);
  final _todosList = <Todo>[];

  final response = await http.get(Uri.parse(
      'https://elegion-hack.herokuapp.com/api/user_tasks/?id_user=1'));

  //response = jsonDecode(utf8.decode(response.bodyBytes));

  if (response.statusCode == 200) {
    for (var i = 0; i < jsonDecode(utf8.decode(response.bodyBytes)).length; ++i) {
      _todosList.add(Todo.fromJson(jsonDecode(utf8.decode(response.bodyBytes))[i]));
    }
  } else {
    throw Exception('Failed to load todos');
  }

  return _todosList;
});
