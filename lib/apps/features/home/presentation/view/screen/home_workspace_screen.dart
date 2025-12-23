import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:dhuwitku/apps/routes/route_names.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/home_controller.dart';

class HomeWorkspaceScreen extends GetView<HomeController> {
  const HomeWorkspaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final workSpace = Get.find<BottomNavBarController>().workspace.value!;
    return Padding(
      padding: YoPadding.all8,
      child: YoCard.filled(
        child: Row(
          children: [
            YoAvatar.image(imageUrl: workSpace.imageUrl),
            YoSpace.adaptiveSm(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YoText.titleMedium(workSpace.name),
                  YoText.bodySmall(workSpace.type.name.capitalize!),
                ],
              ),
            ),
            YoSpace.adaptiveSm(),
            YoButtonIcon.ghost(
              icon: Icon(Iconsax.arrow_down_1_outline, color: textColor),
              onPressed: () {
                final workspaces =
                    Get.find<BottomNavBarController>().workspaces;
                YoBottomSheet.show(
                  context: context,
                  title: "Switch Workspace",
                  child: Column(
                    children: [
                      for (var workspace in workspaces)
                        YoListTile(
                          leading: YoAvatar.image(
                            imageUrl: workspace.imageUrl,
                            variant: YoAvatarVariant.rounded,
                          ),
                          title: workspace.name,
                          subtitleWidget: YoText.bodySmall(
                            workspace.type.name.capitalize!,
                            color: gray400,
                          ),
                          trailing: workspace.id == workSpace.id
                              ? Icon(
                                  Iconsax.tick_circle_bold,
                                  color: primaryColor,
                                )
                              : null,
                          onTap: () {
                            Get.find<BottomNavBarController>().workspace.value =
                                workspace;
                            Get.back();
                          },
                        ),
                      YoListTile(
                        titleWidget: YoText.titleMedium(
                          "Create Workspace",
                          color: primaryColor,
                        ),
                        leading: YoAvatar.icon(
                          icon: Iconsax.add_outline,
                          iconColor: primaryColor,
                          backgroundColor: primaryColor.withValues(alpha: .2),
                        ),
                        onTap: () {},
                      ),
                      YoListTile(
                        title: "Manage Workspace",
                        leading: YoAvatar.icon(icon: Iconsax.setting_3_outline),
                        onTap: () {
                          Get.back();
                          Get.toNamed(RouteNames.WORKSPACE);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
