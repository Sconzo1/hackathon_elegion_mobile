import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:e_legion_hackaton/constants/pages_ids.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../top_level_providers.dart';

class ProjectCard extends ConsumerWidget {
  const ProjectCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final activePageIndex = watch(bottomNavIndexProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(200, 239, 240, 246),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 22.0),
          child: SizedBox(
            height: 80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Проект Start',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Expanded(
                        child: AutoSizeText.rich(
                          TextSpan(
                              text: 'Руководитель - ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              children: [
                                TextSpan(
                                    text: 'Синюков Сергей',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))
                              ]),
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Icon(Icons.file_copy_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'Описание проекта',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        activePageIndex.state = CHAT_PAGE;
                      },
                      color: Colors.blue,
                      iconSize: 40,
                      icon: Icon(Icons.chat_bubble_outline),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
