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

final userLvlDescriptionProvider = StateProvider((ref) =>
    'Ты еще в самом начале пути, пути стать настоящим легионером-мастером. Побеждай монстров-заданий. Проявляй активность, зарабатывай опыт и переходи на новый уровень.');

final userOpenLegionerPhoto = StateProvider<bool>((ref) => false);