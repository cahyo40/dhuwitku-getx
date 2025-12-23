import 'package:dhuwitku/apps/features/activity/presentation/view/activity_view.dart';
import 'package:dhuwitku/apps/features/budget/presentation/view/budget_view.dart';
import 'package:dhuwitku/apps/features/home/presentation/view/home_view.dart';
import 'package:dhuwitku/apps/features/report/presentation/view/report_view.dart';
import 'package:dhuwitku/apps/features/settings/presentation/view/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:yo_ui/yo_ui.dart';

import '../controller/bottom_nav_bar_controller.dart';

class BottomNavBarView extends GetView<BottomNavBarController> {
  const BottomNavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => YoBottomNavBar(
          animationCurve: Curves.fastEaseInToSlowEaseOut,
          currentIndex: controller.currentPage.value,
          items: [
            YoNavItem(
              icon: Iconsax.home_outline,
              label: 'Home',
              activeIcon: Iconsax.home_bold,
            ),
            YoNavItem(
              label: "Budget",
              icon: Iconsax.money_2_outline,
              activeIcon: Iconsax.money_2_bold,
            ),
            YoNavItem(
              label: "Report",
              icon: Iconsax.document_outline,
              activeIcon: Iconsax.document_bold,
            ),
            YoNavItem(
              label: "Activity",
              icon: Iconsax.activity_outline,
              activeIcon: Iconsax.activity_bold,
            ),
            YoNavItem(
              icon: Iconsax.setting_2_outline,
              label: 'Settings',
              activeIcon: Iconsax.setting_2_bold,
            ),
          ],
          onTap: (index) => controller.onChangePage(index),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.error.value != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(controller.error.value!),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.retry,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        return SafeArea(
          child: Obx(() {
            return IndexedStack(
              index: controller.currentPage.value,
              children: [
                const HomeView(),
                const BudgetView(),
                const ReportView(),
                const ActivityView(),
                const SettingsView(),
              ],
            );
          }),
        );
      }),
    );
  }
}
