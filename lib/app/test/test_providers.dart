import 'package:e_legion_hackaton/data/fake_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final questionPackProvider = StateProvider((ref) => questionPacks[0]);
final questionPackChosenProvider = StateProvider((ref) => false);
final questionCheckboxListTileProvider = StateProvider((ref) => false);

final answersCheckboxesProvider = StateProvider<List<bool>>((ref) => List.filled(4, false));
