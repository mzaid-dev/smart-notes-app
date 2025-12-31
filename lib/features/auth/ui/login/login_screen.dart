import 'package:flutter/material.dart';
import 'package:smart_notes_app/core/constants/AppAssets.dart';
import 'package:smart_notes_app/core/utils/responsive.dart';
import 'package:smart_notes_app/features/auth/ui/login/desktop/login_web.dart';
import 'package:smart_notes_app/features/auth/ui/login/mobile/login_mobile.dart';
import 'package:smart_notes_app/features/auth/ui/login/tablet/login_tablet.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: LoginMobile(images: AppAssets.mobileImages),
      tablet: LoginTablet(images: AppAssets.tabletImages),
      desktop: LoginWeb(images: AppAssets.desktopImages),
    );
  }
}
