import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/home_controller.dart' hide auth;

class HomeWorkspaceScreen extends GetView<HomeController> {
  const HomeWorkspaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: YoPadding.all8,
      child: YoCard.filled(
        child: Row(
          children: [
            YoAvatar.image(imageUrl: auth.photoUrl),
            YoSpace.adaptiveSm(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YoText.titleMedium(auth.name),
                  YoText.bodySmall(auth.email),
                ],
              ),
            ),
            YoSpace.adaptiveSm(),
            YoButtonIcon.ghost(
              icon: Icon(Iconsax.arrow_down_1_outline, color: textColor),
              onPressed: () {
                YoBottomSheet.show(
                  context: context,
                  title: "Switch Workspace",
                  child: Column(
                    children: [
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
