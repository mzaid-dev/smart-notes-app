import 'package:flutter/material.dart';
import 'package:smart_notes_app/core/constants/AppAssets.dart';
import 'package:smart_notes_app/features/auth/ui/widgets/bg_wrapper.dart';
import 'package:smart_notes_app/features/auth/ui/widgets/glass_login_card.dart';

import '../../widgets/bg_image_selector.dart';

class LoginWeb extends StatelessWidget {
  final List<String> images;
  const LoginWeb({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BgWrapper(
      bgImagesList: images,
      bgimageselector: (index, onChanged) => BgImageSelector(
        currentIndex: index,
        onIndexChanged: onChanged,
        bgImagesList: images,
      ),
      child: Container(
        height: screenHeight * 0.75,
        width: screenWidth * 0.85,
        decoration: BoxDecoration(color: Colors.transparent),
        child: Row(
          children: [
            Flexible(
              flex: 4,
              child: Center(
                child: GlassLoginCard(
                  screenWidth: screenWidth * 0.4,
                  screenHeight: screenHeight * 0.65,
                ),
              ),
            ),
            SizedBox(width: 80,),
            Flexible(
              flex: 3,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(color: Colors.transparent),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 50,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          AppAssets.loginAvater,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
