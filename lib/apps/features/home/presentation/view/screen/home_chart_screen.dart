import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/home_controller.dart';

class HomeChartScreen extends GetView<HomeController> {
  const HomeChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: YoPadding.top16,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          YoText.titleMedium("Total Spending", fontWeight: FontWeight.bold),
          YoSpace.adaptiveLg(),

          YoBarChart(
            showGrid: false,
            barColor: primaryColor,
            data: [
              YoChartData(x: 1, y: 5, label: "Senin"),
              YoChartData(x: 2, y: 2, label: "Selasa"),
              YoChartData(x: 3, y: 2, label: "Rabu"),
              YoChartData(x: 4, y: 0, label: "Kamis"),
              YoChartData(x: 5, y: 5, label: "Jumat"),
            ],
          ),
        ],
      ),
    );
  }
}
