import 'package:e_legion_hackaton/app/chat/chat_page.dart';
import 'package:e_legion_hackaton/app/introduction/introduction_page.dart';
import 'package:e_legion_hackaton/app/profile/profile_page.dart';
import 'package:e_legion_hackaton/app/test/tests_page.dart';
import 'package:e_legion_hackaton/app/todo/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'introduction',
      routes: {
        'todo' : (_) => TodoPage(),
        'profile' : (_) => ProfilePage(),
        'tests' : (_) => TestsPage(),
        'introduction' : (_) => IntroductionPage(),
        'chat' : (_) => ChatPage(),
      },
    );
  }
}
