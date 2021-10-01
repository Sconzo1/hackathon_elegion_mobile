import 'package:e_legion_hackaton/app/top_level_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final userName = watch(userNameProvider);

    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Container(
            child: Text('Привет, $userName'),
          ),
        ),
      ),
    );
  }
}
