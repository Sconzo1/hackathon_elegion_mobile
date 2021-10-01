import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:e_legion_hackaton/app/top_level_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyNavigationBar extends ConsumerWidget {
  MyNavigationBar({
    Key? key,
  }) : super(key: key);

  final iconsList = <IconData>[
    Icons.check_box,
    Icons.message,
    Icons.help,
    Icons.person,
  ];

  final iconsText = <String>[
    'Тесты',
    'Чат',
    'Гайды',
    'Профиль',
  ];

  @override
  Widget build(BuildContext context, watch) {
    final bottomNavIndex = watch(bottomNavIndexProvider);

    return AnimatedBottomNavigationBar.builder(
      itemCount: iconsList.length,
      tabBuilder: (index, isActive) {
        final color = isActive ? Colors.blue : Colors.black;
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconsList[index],
              size: 24,
              color: color,
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "${iconsText[index]}",
                style: TextStyle(color: color),
              ),
            )
          ],
        );
      },
      activeIndex: bottomNavIndex.state,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.defaultEdge,
      onTap: (index) {
        bottomNavIndex.state = index;
      },
    );
  }
}
