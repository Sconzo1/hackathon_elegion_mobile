import 'package:e_legion_hackaton/app/guides/widgets/guide_chapter.dart';
import 'package:e_legion_hackaton/app/guides/widgets/guides_filter_chips.dart';
import 'package:e_legion_hackaton/app/top_level_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuidesPage extends StatelessWidget {
  const GuidesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chapters = [
      Chapter(
          topic: "Программирование",
          description: "Выявить требования"),
      Chapter(
          topic: "Программирование",
          description: "Добавить диаграмму ВИ"),
      Chapter(
          topic: "Верстка",
          description: "Сверстать красивый лендинг"),
      Chapter(
          topic: "Верстка",
          description: "Настроить фигму")
    ];

    final chapterMap = chapters.groupBy((m) => m.topic);

    return SafeArea(
      child: Column(
        children: [
          GuideFilters(),
          Divider(),
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