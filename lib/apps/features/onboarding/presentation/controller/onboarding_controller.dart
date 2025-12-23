import 'package:dhuwitku/apps/core/assets/images.dart';
import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();

  final PageController pageController = PageController();
  final currentPage = 0.obs;

  List<Map<String, String>> onboardingPages = [
    {
      'image': YoImageAssets.onboarding1,
      'title': L10n.t.onboard_title_1,
      'description': L10n.t.onboard_description_1,
      'cta': L10n.t.onboard_cta_1,
    },
    {
      'image': YoImageAssets.onboarding2,
      'title': L10n.t.onboard_title_2,
      'description': L10n.t.onboard_description_2,
      'cta': L10n.t.onboard_cta_2,
    },
    {
      'image': YoImageAssets.onboarding3,
      'title': L10n.t.onboard_title_3,
      'description': L10n.t.onboard_description_3,
      'cta': L10n.t.onboard_cta_3,
    },
  ];

  void onChangePage(int index) {
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    currentPage.value = index;
  }
}
