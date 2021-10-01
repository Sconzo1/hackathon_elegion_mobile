import 'package:e_legion_hackaton/app/top_level_providers.dart';
import 'package:e_legion_hackaton/widgets/bottom_navigation_bar.dart';
import 'package:e_legion_hackaton/widgets/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final userName = watch(userNameProvider);

    return SafeArea(
      child: Container(
        child: Center(
          child: Text('Привет, это чат'),
        ),
      ),
    );
  }
}
