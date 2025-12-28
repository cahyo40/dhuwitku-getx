import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class HomeUserScreen extends GetView<HomeController> {
  const HomeUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text('HomeUserScreen is working'),
      ),
    );
  }
}
