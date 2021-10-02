import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuideChapter extends StatelessWidget {
  String title;
  List<String> chapters;

  GuideChapter({required this.title, required this.chapters});

  List<ListTile> _getTiles() {
    return this
        .chapters
        .map((chapter) =>
            ListTile(leading: Icon(Icons.document_scanner), title: Text(chapter)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Text("${this.title}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400)),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20.0),
              itemCount: _getTiles().length,
              itemBuilder: (context, index) {
                return _getTiles()[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
