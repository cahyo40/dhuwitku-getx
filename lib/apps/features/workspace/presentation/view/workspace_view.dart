import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:yo_ui/yo_ui.dart';

import '../controller/workspace_controller.dart';

class WorkspaceView extends GetView<WorkspaceController> {
  const WorkspaceView({super.key});

  @override
  Widget build(BuildContext context) {
    final workspaces = Get.find<BottomNavBarController>().workspaces;
    return Scaffold(
      appBar: YoAppBar.transparent(title: "Workspace"),

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
          child: ListView.builder(
            itemCount: workspaces.length,
            itemBuilder: (context, index) {
              final workspace = workspaces[index];
              return YoListTile(
                leading: YoAvatar.image(
                  imageUrl: workspace.imageUrl,
                  variant: YoAvatarVariant.rounded,
                ),
                title: workspace.name,
                subtitleWidget: YoText.bodySmall(
                  workspace.type.name.capitalize!,
                  color: gray400,
                ),
                trailing:
                    workspace.id ==
                        Get.find<BottomNavBarController>().workspace.value?.id
                    ? Icon(Iconsax.tick_circle_bold, color: primaryColor)
                    : null,
                onTap: () {},
              );
            },
          ),
        );
      }),
    );
  }
}
