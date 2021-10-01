import 'package:e_legion_hackaton/app/top_level_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IntroductionPage extends ConsumerWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final userName = watch(userNameProvider);

    return SafeArea(
      child: Container(
        child: Center(
          child: Text('Привет, это интро'),
        ),
      ),
    );
  }
}
