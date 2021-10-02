

import 'package:flutter_riverpod/flutter_riverpod.dart';

final userExpProvider = StateProvider<int>((ref) => 80);

final userLvlProvider = StateProvider<int>((ref) {
  var userExp = ref.watch(userExpProvider).state;

  return (userExp + 100) ~/ 100;
});

final userLvlProgressProvider = StateProvider<double>((ref) {
  var userExp = ref.watch(userExpProvider).state;

  return (userExp % 100) / 100;
});

final userRankProvider = StateProvider((ref) => 'легионер-новичок');