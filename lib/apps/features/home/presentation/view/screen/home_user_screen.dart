import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/home_controller.dart';

class HomeUserScreen extends GetView<HomeController> {
  const HomeUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return YoRow(
      padding: YoPadding.all8,
      spacing: 8,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              YoText.bodySmall('Selamat datang'),
              YoText.titleLarge(
                "Hallo, ${auth.name}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
        YoAvatar.image(imageUrl: auth.photoUrl, showBadge: true),
      ],
    );
  }
}
