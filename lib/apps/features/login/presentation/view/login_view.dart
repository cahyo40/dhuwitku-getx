import 'package:dhuwitku/apps/core/assets/images.dart';
import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: YoColumn(
          padding: YoPadding.all16,
          children: [
            // space
            Spacer(),
            // logo
            YoCard(
              borderRadius: BorderRadius.circular(100),
              shadows: YoBoxShadow.sharp(context),
              child: YoImage.asset(
                assetPath: YoImageAssets.logo,
                shape: BoxShape.circle,
                fit: BoxFit.cover,
                height: context.yoScreenWidth * 0.35,
                width: context.yoScreenWidth * 0.35,
              ),
            ),
            YoSpace.adaptiveSm(),
            YoText.headlineLarge(L10n.t.app_name, fontWeight: FontWeight.bold),
            YoSpace.adaptiveSm(),
            YoText.bodyMedium(L10n.t.login_subtitle, color: context.gray500),
            YoSpace.adaptiveXl(),
            Obx(
              () => YoButton.pill(
                expanded: true,
                icon: Icon(FontAwesomeIcons.google),
                text: L10n.t.login_cta,
                onPressed: controller.isLoading.isTrue
                    ? null
                    : controller.onLogin,
                isLoading: controller.isLoading.isTrue,
              ),
            ),
            Spacer(),
            YoText.bodySmall(
              L10n.t.login_terms,
              align: TextAlign.center,
              color: context.gray300,
            ),
          ],
        ),
      ),
    );
  }
}
