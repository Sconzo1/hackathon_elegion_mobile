import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class GuideChapter extends StatelessWidget {
  final MapEntry<String, List<Chapter>> grouped_chapters;
  PdfController _pdfController = PdfController(
    document: PdfDocument.openAsset('assets/sample.pdf'));

  GuideChapter({Key? key, required this.grouped_chapters}) : super(key: key);
  // Widget pdfView() => PdfView(
  //   controller: pdfController,
  // );



  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            ListTile(
                title: Text(grouped_chapters.key,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400))
            ),

            for (var subChapter in this.grouped_chapters.value)
              ListTile(
                  leading: Icon(Icons.document_scanner),
                  title: Text(subChapter.description)
              ),
          ],
        ),
      ),
      onTap: () => {
      _pdfController.loadDocument(
      PdfDocument.openAsset('assets/dummy.pdf'))

      },
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
