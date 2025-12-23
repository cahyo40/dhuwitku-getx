import 'package:dhuwitku/apps/core/services/cache.dart';
import 'package:dhuwitku/apps/routes/route_names.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../controller/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: YoColumn(
          padding: YoPadding.all16,
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (i) {
                  controller.onChangePage(i);
                },
                physics: NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                itemCount: controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  final page =
                      controller.onboardingPages[controller.currentPage.value];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      YoImage.asset(
                        assetPath: page['image']!,
                        height: context.yoScreenWidth * 0.8,
                        width: context.yoScreenWidth * 0.8,
                        fit: BoxFit.contain,
                        borderRadius: BorderRadius.circular(999999),
                      ),
                      YoSpace.adaptiveLg(),
                      YoText.headlineMedium(
                        page['title']!,
                        align: TextAlign.center,
                        fontWeight: FontWeight.bold,
                      ),
                      YoSpace.adaptiveSm(),
                      YoText.bodyMedium(
                        page['description']!,
                        align: TextAlign.center,
                        color: gray300,
                      ),
                    ],
                  );
                },
              ),
            ),
            YoSpace.adaptiveMd(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.onboardingPages.length,
                (index) => Obx(
                  () => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.only(right: 8),
                    width: controller.currentPage.value == index ? 20 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: controller.currentPage.value == index
                          ? primaryColor
                          : gray500,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
            YoSpace.adaptiveXl(),
            Obx(
              () => YoButton.modern(
                backgroundColor: primaryColor,
                expanded: true,
                text: controller
                    .onboardingPages[controller.currentPage.value]['cta']!,
                onPressed: () {
                  if (controller.currentPage.value ==
                      controller.onboardingPages.length - 1) {
                    YoCache.saveOnboard(false);
                    Get.offAllNamed(RouteNames.LOGIN);
                  }
                  controller.onChangePage(
                    controller.onboardingPages.length - 1,
                  );
                },
              ),
            ),
            YoSpace.adaptiveXl(),
          ],
        ),
      ),
    );
  }
}
