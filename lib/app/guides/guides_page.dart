import 'package:e_legion_hackaton/app/guides/widgets/guide_chapter.dart';
import 'package:e_legion_hackaton/app/guides/widgets/guides_filter_chips.dart';
import 'package:e_legion_hackaton/data/fake_data.dart';
import 'package:flutter/material.dart';

class GuidesPage extends StatelessWidget {
  const GuidesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chapterMap = chapters.groupBy((m) => m.topic);

    return SafeArea(
      child: ListView(
        children: [
          Padding(padding: EdgeInsets.only(top: 12, left: 12)),
          Center(
            child: Text(
              'Фильтры:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GuideFilters(),
          ),
          for (var entry in chapterMap.entries) GuideChapter(grouped_chapters: entry),
        ],
      ),
    );
  }
}


extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
          (Map<K, List<E>> map, E element) =>
      map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}