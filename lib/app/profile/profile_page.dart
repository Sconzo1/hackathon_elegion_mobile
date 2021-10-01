import 'package:e_legion_hackaton/widgets/bottom_navigation_bar.dart';
import 'package:e_legion_hackaton/widgets/floating_action_button.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text('Привет, это профиль'),
          ),
        ),
      ),
    );
  }
}
