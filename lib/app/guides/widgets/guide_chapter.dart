import 'package:e_legion_hackaton/app/guides/widgets/pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class GuideChapter extends StatelessWidget {
  final MapEntry<String, List<Chapter>> grouped_chapters;

  GuideChapter({Key? key, required this.grouped_chapters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          ListTile(
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (_) => MyPdfViewer()))
            },
            title: Text(
              grouped_chapters.key,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            ),
          ),
          for (var subChapter in this.grouped_chapters.value)
            ListTile(
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (_) => MyPdfViewer()))
              },
              leading: Icon(Icons.document_scanner),
              title: Text(subChapter.description),
            ),
        ],
      ),
    );
  }
}

class Chapter {
  String topic;
  String description;

  Chapter({
    required this.topic,
    required this.description,
  });
}

// Expanded(
//   child: ListView.builder(
//     padding: const EdgeInsets.all(0.0),
//     itemCount: this.chapter.subChapters.length,
//     itemBuilder: (context, index) {
//       // return header
//       if (index == 0){
//         return ListTile(title: Text(chapter.topic, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400)));
//       }
//       index -=1;
//       return ListTile(leading: Icon(Icons.document_scanner), title: Text(this.chapter.subChapters[index]));
//     },
//   ),
// ),
