import 'package:e_legion_hackaton/app/test/test_1/test_1.dart';
import 'package:e_legion_hackaton/widgets/bottom_navigation_bar.dart';
import 'package:e_legion_hackaton/widgets/floating_action_button.dart';
import 'package:flutter/material.dart';

class TestsPage extends StatelessWidget {
  const TestsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: TestOne(),
      ),
    );
  }
}
