import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:dhuwitku/apps/features/budget/presentation/view/budget_view.dart';
import 'package:dhuwitku/apps/features/home/presentation/view/home_view.dart';
import 'package:dhuwitku/apps/features/report/presentation/view/report_view.dart';
import 'package:dhuwitku/apps/features/settings/presentation/view/settings_view.dart';
import 'package:dhuwitku/apps/features/transaction/presentation/view/transaction_view.dart';
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
              label: L10n.t.home,
              activeIcon: Iconsax.home_bold,
            ),
            YoNavItem(
              label: L10n.t.transaction,
              icon: Iconsax.receipt_outline,
              activeIcon: Iconsax.receipt_bold,
            ),
            YoNavItem(
              label: L10n.t.budget,
              icon: Iconsax.money_2_outline,
              activeIcon: Iconsax.money_2_bold,
            ),
            YoNavItem(
              label: L10n.t.report,
              icon: Iconsax.document_outline,
              activeIcon: Iconsax.document_bold,
            ),
            YoNavItem(
              icon: Iconsax.setting_2_outline,
              label: L10n.t.settings,
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
          return YoErrorState(
            title: L10n.t.error_title,
            description: controller.error.value!,
            onRetry: controller.retry,
          );
        }

        return SafeArea(
          child: Obx(() {
            return IndexedStack(
              index: controller.currentPage.value,
              children: [
                const HomeView(),
                const TransactionView(),
                const BudgetView(),
                const ReportView(),
                const SettingsView(),
              ],
            );
          }),
        );
      }),
    );
  }
}
