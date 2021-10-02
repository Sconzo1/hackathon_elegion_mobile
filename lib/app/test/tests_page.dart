import 'package:e_legion_hackaton/app/test/test_providers.dart';
import 'package:e_legion_hackaton/app/test/widgets/pick_test.dart';
import 'package:e_legion_hackaton/app/test/widgets/result.dart';
import 'package:e_legion_hackaton/app/test/widgets/test_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestsPage extends ConsumerWidget {
  const TestsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {

    final activeTestPage = watch(activeTestPageProvider);

    Widget? _getContent() {
      switch (activeTestPage.state) {
        case 1: {
          return PickTest();
        }
        case 2: {
          return FirstTest();
        }
        case 3: {
          return TestResult();
        }
      }
    }

    return SafeArea(
      child: _getContent()!
    );
  }
}
