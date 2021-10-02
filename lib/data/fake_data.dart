import 'package:e_legion_hackaton/app/guides/widgets/guide_chapter.dart';
import 'package:e_legion_hackaton/app/todo/widgets/todo_list_tile.dart';
import 'package:e_legion_hackaton/data/todo.dart';

final List<Todo> fakeTodos = [
  new Todo(id: 1, name: 'Пройти тест на знание компании', description: 'Пройти тест на знание компании Пройти тест на знание компании Пройти тест на знание компании', deadline: DateTime.now().add(Duration(days: 7)), isDone: false, todoWeight: 2, todoOwner: 'Елизавета, HR'),
  new Todo(id: 1, name: 'Познакомиться с командой', description: 'Пройти тест на знание компании Пройти тест на знание компании Пройти тест на знание компании', deadline: DateTime.now().add(Duration(days: 4)), isDone: false, todoWeight: 3, todoOwner: 'Елизавета, HR'),
  new Todo(id: 1, name: 'Выполнить тестовое задание', description: 'Пройти тест на знание компании Пройти тест на знание компании Пройти тест на знание компании', deadline: DateTime.now().add(Duration(days: 2)), isDone: false, todoWeight: 5, todoOwner: 'Анна Ларионовна, PM'),
  new Todo(id: 1, name: 'Созвониться с HR', description: 'Пройти тест на знание компании Пройти тест на знание компании Пройти тест на знание компании', deadline: DateTime.now().subtract(Duration(days: 1)), isDone: true, todoWeight: 5, todoOwner: 'Елизавета, HR'),
  new Todo(id: 1, name: 'Прочитать гайды', description: 'Пройти тест на знание компании Пройти тест на знание компании Пройти тест на знание компании', deadline: DateTime.now().subtract(Duration(days: 1)), isDone: true, todoWeight: 1, todoOwner: 'Елизавета, HR'),
  new Todo(id: 1, name: 'Поздороваться с командой в чате', description: 'Пройти тест на знание компании Пройти тест на знание компании Пройти тест на знание компании', deadline: DateTime.now().add(Duration(days: 10)), isDone: false, todoWeight: 2, todoOwner: 'Елизавета, HR'),
];

final chapters = [
  Chapter(
      topic: "Программирование",
      description: "Документация Android для разработчиков"),
  Chapter(
      topic: "Программирование",
      description: "Изображения для приложения"),
  Chapter(
      topic: "Программирование",
      description: "Организация работы с Git"),
  Chapter(
      topic: "Программирование",
      description: "Верстка"),
  Chapter(
      topic: "Статьи",
      description: "Сверстать красивый лендинг"),
  Chapter(
      topic: "How Tobe",
      description: "Как быть программистом"),
  Chapter(
      topic: "How Tobe",
      description: "Как быть дизайнером"),
  Chapter(
      topic: "Непрограммирование",
      description: "Запуск приложения"),
  Chapter(
      topic: "Непрограммирование",
      description: "Правила обращения в чатах"),
  Chapter(
      topic: "Непрограммирование",
      description: "Правила запуска проекта")
];