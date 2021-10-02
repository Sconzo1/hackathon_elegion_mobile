
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
    } else if (deadline.difference(DateTime.now()).inDays <= 2) {
      todoFilter = 1;
    } else if (deadline.difference(DateTime.now()).inDays <= 4) {
      todoFilter = 2;
    } else {
      todoFilter = 3;
    }
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      name: json['task'].cast<Map, dynamic>()['name'],
      description: json['task'].cast<Map, dynamic>()['desc'],
      deadline: DateTime.parse(json['date_expired']),
      isDone: json['is_done'],
      todoWeight: json['weight'],
      todoOwner: json['manager'].cast<Map, dynamic>()['email'],
    );
  }

  String? getMonsterName() {
    switch (todoWeight) {
      case 1: {
        return 'Легко';
      }
      case 2: {
        return 'Нормально';
      }
      case 3: {
        return 'Сложно';
      }
      case 4: {
        return 'Оч. сложно';
      }
      case 5: {
        return 'ебать)';
      }
    }
  }
}