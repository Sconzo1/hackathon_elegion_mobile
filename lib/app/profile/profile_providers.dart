import 'package:e_legion_hackaton/app/todo/todo_providers.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userExpProvider = StateProvider<int>((ref) {
  final todos = ref.watch(todosListProvider);
  var exp = 0;
  for (var todo in todos.data!.value) {
    if (todo.isDone)
      exp += todo.todoWeight * 25; // ВЕС ЗАДАЧИ В ОПЫТ
  }
  return exp;
});

final userLvlProvider = StateProvider<int>((ref) {
  var userExp = ref.watch(userExpProvider).state;

  return (userExp + 100) ~/ 100;
});

final userLvlProgressProvider = StateProvider<double>((ref) {
  var userExp = ref.watch(userExpProvider).state;

  return (userExp % 100) / 100;
});

final userRankProvider = StateProvider((ref) => 'легионер-новичок');

final userLvlDescriptionProvider = StateProvider((ref) =>
    'Ты еще в самом начале пути, пути стать настоящим легионером-мастером. Побеждай монстров-заданий. Проявляй активность, зарабатывай опыт и переходи на новый уровень.');

final userOpenLegionerPhoto = StateProvider<bool>((ref) => false);

final animatedPaddingValueProvider = StateProvider<double>((ref) => 4.0);