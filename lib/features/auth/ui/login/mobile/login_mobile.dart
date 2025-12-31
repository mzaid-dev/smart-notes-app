import 'package:flutter/material.dart';
import 'package:smart_notes_app/features/auth/ui/widgets/bg_wrapper.dart';

import '../../widgets/bg_image_selector.dart';

class LoginMobile extends StatelessWidget {
  final List<String> images;
  const LoginMobile({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return BgWrapper(
      child: Text("Mobile"),
      bgimageselector: (index, onChanged) => BgImageSelector(
        currentIndex: index,
        onIndexChanged: onChanged,
        bgImagesList: images,
      ),
      bgImagesList: images,
    );
  }
}
