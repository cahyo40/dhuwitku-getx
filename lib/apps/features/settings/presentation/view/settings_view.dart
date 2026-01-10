import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:dhuwitku/apps/routes/route_names.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:yo_ui/yo_ui.dart';

import '../controller/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'.tr), centerTitle: true),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const YoLoading();
        }

        if (controller.error.value != null) {
          return YoErrorState(onRetry: controller.retry);
        }

        return SafeArea(
          child: Padding(
            padding: YoAdaptive.pagePadding(context),
            child: Column(
              spacing: YoAdaptive.spacingSm(context),
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      YoListTile(
                        title: "Profile".tr,
                        leading: YoAvatar.icon(
                          icon: Iconsax.user_outline,
                          iconColor: primaryColor,
                          backgroundColor: primaryColor.withValues(alpha: .2),
                        ),
                        onTap: () {},
                      ),
                      // Workspace Section
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          YoText.titleSmall(
                            "WORKSPACE & COLLABORATION",
                            color: gray300,
                          ),
                          YoCard.filled(
                            padding: YoPadding.all4,
                            child: Column(
                              spacing: YoAdaptive.spacingXs(context),
                              children: [
                                YoListTile(
                                  title: L10n.t.category.capitalize!,
                                  leading: YoAvatar.icon(
                                    variant: YoAvatarVariant.rounded,
                                    icon: Iconsax.category_outline,
                                    iconColor: primaryColor,
                                    backgroundColor: primaryColor.withValues(
                                      alpha: .2,
                                    ),
                                  ),
                                  trailing: Icon(
                                    Iconsax.arrow_right_3_outline,
                                    color: gray300,
                                  ),
                                  onTap: () => Get.toNamed(RouteNames.CATEGORY),
                                ),
                                YoListTile(
                                  title: "Invite Colaborator",
                                  leading: YoAvatar.icon(
                                    variant: YoAvatarVariant.rounded,
                                    icon: Iconsax.user_add_outline,
                                    iconColor: primaryColor,
                                    backgroundColor: primaryColor.withValues(
                                      alpha: .2,
                                    ),
                                  ),
                                  trailing: Icon(
                                    Iconsax.arrow_right_3_outline,
                                    color: gray300,
                                  ),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // APP preferences
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          YoText.titleSmall("APP PREFERENCES", color: gray300),
                          YoCard.filled(
                            padding: YoPadding.all4,
                            child: Column(
                              spacing: YoAdaptive.spacingXs(context),
                              children: [
                                YoListTile(
                                  title: "Language",
                                  leading: YoAvatar.icon(
                                    variant: YoAvatarVariant.rounded,
                                    icon: Iconsax.language_square_outline,
                                    iconColor: warningColor,
                                    backgroundColor: warningColor.withValues(
                                      alpha: .2,
                                    ),
                                  ),
                                  trailing: Icon(
                                    Iconsax.arrow_right_3_outline,
                                    color: gray300,
                                  ),
                                  onTap: () {},
                                ),
                                YoListTile(
                                  title: "Hide Amounts",
                                  leading: YoAvatar.icon(
                                    variant: YoAvatarVariant.rounded,
                                    icon: Iconsax.lock_outline,
                                    iconColor: warningColor,
                                    backgroundColor: warningColor.withValues(
                                      alpha: .2,
                                    ),
                                  ),
                                  trailing: Icon(
                                    Iconsax.arrow_right_3_outline,
                                    color: gray300,
                                  ),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                YoButton.custom(
                  expanded: true,
                  text: "Sign out",
                  textColor: errorColor,
                  onPressed: () async {
                    YoConfirmDialog.show(
                      context: context,
                      title: "Sign out",
                      message: "Are you sure you want to sign out?",
                    ).then((confimation) async {
                      if (confimation == true) {
                        await auth.signOut();
                      }
                    });
                  },
                  icon: Icon(Iconsax.logout_1_outline, color: errorColor),
                  backgroundColor: errorColor.withValues(alpha: .2),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
