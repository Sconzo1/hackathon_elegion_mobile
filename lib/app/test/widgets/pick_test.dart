import 'package:e_legion_hackaton/app/test/test_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PickTest extends ConsumerWidget {
  const PickTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final activeTestPage = watch(activeTestPageProvider);
    final firstTest = watch(firstTestProvider);
    final secondTest = watch(secondTestProvider);


    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Тесты",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
            ListTile(
              leading: Icon(Icons.folder_open_outlined),
              title: Text(firstTest.questionPackName),
              onTap: () => {
                activeTestPage.state = 2
              },
            ),
            ListTile(
              leading: Icon(Icons.folder_open_outlined),
              title: Text(secondTest.questionPackName),
              onTap: () => {
                activeTestPage.state = 2
              },
            ),
            ListTile(
              leading: Icon(Icons.folder_open_outlined),
              title: Text('Как сделать самый смешной стикерпак'),
              onTap: () => {
                activeTestPage.state = 2
              },
            ),
            ListTile(
              leading: Icon(Icons.folder_open_outlined),
              title: Text('ОГЭ по математике'),
              onTap: () => {
                activeTestPage.state = 2
              },
            ),
          ],
        ),
      ),
    );
  }
}
