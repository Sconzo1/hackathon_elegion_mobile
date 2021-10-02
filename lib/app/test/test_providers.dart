import 'package:e_legion_hackaton/data/fake_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final questionPackChosenProvider = StateProvider((ref) => false);
final questionCheckboxListTileProvider = StateProvider((ref) => false);

final answersCheckboxesProvider = StateProvider<List<bool>>((ref) => List.filled(4, false));



final firstTestProvider = Provider((ref) => firstTest);
final secondTestProvider = Provider((ref) => secondTest);

final activeTestPageProvider = StateProvider((ref) => 1);

final questionNumProvider = StateProvider((ref) => 0);

enum Radios { a, b, c, d }
final pickedAnswer = StateProvider<Radios?>((ref) => null);

final rightAnswersProvider = StateProvider((ref) => 0);