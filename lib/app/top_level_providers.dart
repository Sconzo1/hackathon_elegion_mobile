import 'package:e_legion_hackaton/constants/pages_ids.dart';
import 'package:e_legion_hackaton/constants/pages_names.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userNameProvider = Provider((ref) => 'Алексей');

final userCompleteIntroductionProvider = StateProvider((ref) => true);

final bottomNavIndexProvider = StateProvider<int>((ref) {
  if (ref.watch(userCompleteIntroductionProvider).state)
    return TODO_PAGE;
  else
    return INTRODUCTION_PAGE;
});

final pageNameProvider = StateProvider<String?>((ref) {
  switch (ref.watch(bottomNavIndexProvider).state) {
    case TESTS_PAGE : {
      return TESTS_PAGE_NAME;
    }
    case CHAT_PAGE : {
      return CHAT_PAGE_NAME;
    }
    case GUIDES_PAGE : {
      return GUIDES_PAGE_NAME;
    }
    case PROFILE_PAGE : {
      return PROFILE_PAGE_NAME;
    }
    case TODO_PAGE : {
      return TODO_PAGE_NAME;
    }
  }
});

