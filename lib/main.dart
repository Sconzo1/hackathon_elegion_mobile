import 'package:e_legion_hackaton/app/chat/chat_page.dart';
import 'package:e_legion_hackaton/app/guides/guides_page.dart';
import 'package:e_legion_hackaton/app/introduction/introduction_page.dart';
import 'package:e_legion_hackaton/app/profile/profile_page.dart';
import 'package:e_legion_hackaton/app/test/tests_page.dart';
import 'package:e_legion_hackaton/app/todo/todo_page.dart';
import 'package:e_legion_hackaton/constants/pages_ids.dart';
import 'package:e_legion_hackaton/widgets/bottom_navigation_bar.dart';
import 'package:e_legion_hackaton/widgets/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/top_level_providers.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyNavigation(),
    );
  }
}

class MyNavigation extends ConsumerWidget {
  const MyNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final bottomNavIndex = watch(bottomNavIndexProvider);
    final appBarName = watch(pageNameProvider);

    Widget? _getBody() {
      switch (bottomNavIndex.state) {
        case TESTS_PAGE :
          {
            return TestsPage();
          }
        case CHAT_PAGE :
          {
            return ChatPage();
          }
        case GUIDES_PAGE :
          {
            return GuidesPage();
          }
        case PROFILE_PAGE :
          {
            return ProfilePage();
          }
        case TODO_PAGE :
          {
            return TodoPage();
          }
      }
    }

    if (bottomNavIndex.state == INTRODUCTION_PAGE)
      return IntroductionPage();
    else
      return Scaffold(
        appBar: AppBar(
          title: Text('${appBarName.state}'),
        ),
        body: _getBody(),
        floatingActionButton: MyFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: MyNavigationBar(),
      );
  }
}

