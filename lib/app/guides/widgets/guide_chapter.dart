import 'package:e_legion_hackaton/app/guides/widgets/pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

import '../guides_providers.dart';

class GuideChapter extends ConsumerWidget {
  final MapEntry<String, List<Chapter>> grouped_chapters;

  GuideChapter({Key? key, required this.grouped_chapters}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final firstGuideFilter = watch(firstGuideFilterProvider);
    final secondGuideFilter = watch(secondGuideFilterProvider);
    final thirdGuideFilter = watch(thirdGuideFilterProvider);
    final fourthGuideFilter = watch(fourthGuideFilterProvider);

    if (!firstGuideFilter.state && grouped_chapters.key =='Программирование') return Container();
    if (!secondGuideFilter.state && grouped_chapters.key =='Статьи') return Container();
    if (!thirdGuideFilter.state && grouped_chapters.key =='How Tobe') return Container();
    if (!fourthGuideFilter.state && grouped_chapters.key =='Непрограммирование') return Container();

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MyPdfViewer(),
                  ),
                ),
              },
              leading: Icon(Icons.picture_as_pdf_outlined, size: 32,),
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

