import 'package:e_legion_hackaton/data/fake_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firstFilterProvider = StateProvider((ref) => true);
final secondFilterProvider = StateProvider((ref) => true);
final thirdFilterProvider = StateProvider((ref) => true);

final todosListProvider = Provider((ref) => fakeTodos);