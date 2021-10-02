
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../profile_providers.dart';

class LegionnairePhoto extends ConsumerWidget {
  const LegionnairePhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final userExp = watch(userExpProvider);
    final userLvlProgress = watch(userLvlProgressProvider);
    final userLvl = watch(userLvlProvider);
    final padValue = watch(animatedPaddingValueProvider);

    // Timer.periodic(Duration(seconds: 4), (timer) {
    //   padValue.state = (padValue.state == 15.0) ? 0.0 : 15.0;
    //   print('state: ${padValue.state}');
    // });

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
              child: Padding(
                padding: EdgeInsets.only(top: 90, left: 70, right: 70),
                child: FittedBox(
                  child: Image.asset(
                    'assets/lvl_${userLvl.state}.png',
                  ),
                  //fit: BoxFit.fitWidth,
                ),
              ),
              margin: EdgeInsets.only(bottom: 40, left: 12, right: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(
                      'assets/bg.png'),
                ),
              ),
            ),
          );
        },
        transitionBuilder: (_, anim, __, child) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(parent: anim, curve: Curves.easeInOutBack)),
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
                // color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset('assets/lvl_${userLvl.state}.png'),
                ),
                fit: BoxFit.fitWidth,
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
          Text(
            '${userExp.state} XP',
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
