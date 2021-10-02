import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../profile_providers.dart';

class LegionerPhoto extends ConsumerWidget {
  const LegionerPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final userExp = watch(userExpProvider);
    final userLvlProgress = watch(userLvlProgressProvider);

    void _showDialog() {
      showGeneralDialog(
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 500),
        context: context,
        pageBuilder: (_, __, ___) {
          return Align(
            alignment: Alignment.center,
            child: Container(
              height: 500,
              child: SizedBox.expand(child: FlutterLogo()),
              margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          );
        },
        transitionBuilder: (_, anim, __, child) {
          return FadeTransition(
            //position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
            opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: anim, curve: Curves.easeInOutBack)),
            child: child,
          );
        },
      );
    }

    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          InkWell(
            onTap: _showDialog,
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                child: LinearProgressIndicator(
                  minHeight: 10,
                  value: userLvlProgress.state,
                  semanticsValue: '${userLvlProgress.state * 100} %',
                ),
              ),
            ),
          ),
          Text('${userExp.state} XP', style: TextStyle(fontSize: 16),)
        ],
      ),
    );
  }
}
