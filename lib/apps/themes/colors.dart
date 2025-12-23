import 'dart:ui';

import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

final Color primaryColor = Get.context!.primaryColor;
final Color secondaryColor = Get.context!.secondaryColor;
final Color accentColor = Get.context!.accentColor;
final Color backgroundColor = Get.context!.backgroundColor;
final Color textColor = Get.context!.textColor;
final Color errorColor = Get.context!.errorColor;
final Color successColor = Get.context!.successColor;
final Color warningColor = Get.context!.warningColor;
final Color infoColor = Get.context!.infoColor;

final Color gray100 = Get.context!.gray100;
final Color gray200 = Get.context!.gray200;
final Color gray300 = Get.context!.gray300;
final Color gray400 = Get.context!.gray400;
final Color gray500 = Get.context!.gray500;
final Color gray600 = Get.context!.gray600;
final Color gray700 = Get.context!.gray700;
final Color gray800 = Get.context!.gray800;
final Color gray900 = Get.context!.gray900;

final Color onPrimaryColor = Get.context!.onPrimaryColor;
final Color onBackgroundColor = Get.context!.onBackgroundColor;
final Color onCardColor = Color.lerp(
  Get.context!.backgroundColor,
  Get.context!.primaryColor,
  .075,
)!;
