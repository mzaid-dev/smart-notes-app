import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_notes_app/core/constants/AppAssets.dart';
import 'package:smart_notes_app/core/theme/theme_helpers.dart';

import 'bg_image_selector.dart';

class BgWrapper extends StatefulWidget {
  const BgWrapper({super.key});

  @override
  State<BgWrapper> createState() => _BgWrapperState();
}

class _BgWrapperState extends State<BgWrapper> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.scaffoldBg,
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: Tween(begin: 1.3, end: 1.0).animate(
                      CurvedAnimation(parent: animation, curve: Curves.linear),
                    ),
                    child: child,
                  ),
                );
              },
              child: Image.asset(
                AppAssets.bgImages[_currentIndex],
                key: ValueKey<int>(_currentIndex),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),

          // Center(
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(30),
          //     child: BackdropFilter(
          //       filter: ImageFilter.blur(
          //         sigmaX: 15,
          //         sigmaY: 15,
          //       ),
          //       child: Container(
          //         width: MediaQuery.of(context).size.width * 0.8,
          //         height: 250,
          //         decoration: BoxDecoration(
          //           color: Colors.white.withOpacity(
          //             0.2,
          //           ),
          //           borderRadius: BorderRadius.circular(30),
          //           border: Border.all(
          //             color: Colors.white.withOpacity(0.3),
          //             width: 1.5,
          //           ),
          //         ),
          //         child: Center(
          //           child: Text(
          //             "Premium Design",
          //             style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 28,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 40),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomMacOSDock(
                currentIndex: _currentIndex,
                onIndexChanged: (newVal) {
                  setState(() {
                    _currentIndex = newVal;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
