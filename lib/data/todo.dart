import 'dart:math';

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
    } else if (todoOwner == 'Redmine') {
      todoFilter = 3;
    } else if (deadline.difference(DateTime.now()).inDays <= 3) {
      todoFilter = 1;
    } else {
      todoFilter = 2;
    }
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] ?? Random().nextInt(1000) + 200,
      name: json['task']?.cast<Map, dynamic>()['name'] ?? json['name'],
      description:
          json['task']?.cast<Map, dynamic>()['desc'] ?? 'Задача с Redmine',
      deadline: DateTime.parse(json['date_expired']),
      isDone: json['is_done'] ?? false,
      todoWeight: json['weight'] ?? json['priority'],
      todoOwner: json['manager']?.cast<Map, dynamic>()['email'] ?? 'Redmine',
    );
  }

  String? getMonsterName() {
    switch (todoWeight) {
      case 1:
        {
          return 'Легко';
        }
      case 2:
        {
          return 'Нормально';
        }
      case 3:
        {
          return 'Сложно';
        }
      case 4:
        {
          return 'Оч. сложно';
        }
      case 5:
        {
          return 'ебать)';
        }
    }
  }
}
