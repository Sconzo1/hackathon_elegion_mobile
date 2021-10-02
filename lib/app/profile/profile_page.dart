import 'dart:io';

import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:e_legion_hackaton/app/profile/profile_providers.dart';
import 'package:e_legion_hackaton/app/profile/widgets/legioner_photo.dart';
import 'package:e_legion_hackaton/app/profile/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../top_level_providers.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final userLvl = watch(userLvlProvider);
    final userRank = watch(userRankProvider);
    final userLvlDescription = watch(userLvlDescriptionProvider);

    final userName = watch(userNameProvider);
    final userEmail = watch(userEmailProvider);
    final userPhone = watch(userEmailProvider);
    final userDateBirth = watch(userEmailProvider);
    final userPosition = watch(userEmailProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              '$userName',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '${userRank.state}, ${userLvl.state} LVL',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: LegionerPhoto(),
                ),
                Spacer(),
                Expanded(
                    flex: 15,
                    child: Container(
                      height: 160,
                      child: AutoSizeText(
                        '${userLvlDescription.state}',
                        style: TextStyle(fontSize: 16),
                        maxLines: 10,
                      ),
                    )),
              ],
            ),
            Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Текущие проекты:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => ProjectCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
