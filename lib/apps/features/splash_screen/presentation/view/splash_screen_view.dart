import 'package:dhuwitku/apps/core/assets/images.dart';
import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../controller/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
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
              YoSpace.adaptiveLg(),
              YoText.headlineLarge(
                L10n.t.app_name,
                fontWeight: FontWeight.bold,
              ),
              YoSpace.adaptiveSm(),
              YoText.titleSmall(
                L10n.t.personal_finance,
                color: context.gray300,
              ),
              Spacer(),
              YoText.monoMedium('YoDev', color: context.gray300),
              YoText.monoMedium('1.0.0', color: context.gray300),
            ],
          ),
        ),
      ),
    );
  }
}
