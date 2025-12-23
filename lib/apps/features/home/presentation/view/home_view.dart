import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:dhuwitku/apps/features/home/presentation/view/screen/home_chart_screen.dart';
import 'package:dhuwitku/apps/features/home/presentation/view/screen/home_latest_transaction_screen.dart';
import 'package:dhuwitku/apps/features/home/presentation/view/screen/home_total_balance_screen.dart';
import 'package:dhuwitku/apps/features/home/presentation/view/screen/home_workspace_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:yo_ui/yo_ui.dart';

import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final workspace = Get.find<BottomNavBarController>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9999),
        ),
        onPressed: () {},
        child: Icon(Iconsax.add_outline),
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
          child: Column(
            children: [
              HomeWorkspaceScreen(),
              Expanded(
                child: ListView(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: YoPadding.all16,
                  children: [
                    HomeTotalBalanceScreen(),
                    HomeChartScreen(),
                    HomeLatestTransactionScreen(),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
