import 'package:e_legion_hackaton/app/guides/widgets/guide_chapter.dart';
import 'package:e_legion_hackaton/app/guides/widgets/guides_filter_chips.dart';
import 'package:e_legion_hackaton/app/top_level_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuidesPage extends ConsumerWidget {
  const GuidesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final userName = watch(userNameProvider);

    final List<GuideChapter> guides = [
      GuideChapter(
          title: "Программирование",
          chapters: ["Выявить требования", "Добавить диаграмму ВИ"]),
      GuideChapter(
          title: "Верстка",
          chapters: ["Сверстать красивый лендинг", "настроить фигму"])
    ];

    return SafeArea(
      child: Column(
        children: [
          GuideFilters(),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: guides.length,
              itemBuilder: (context, index) {
                return guides[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
