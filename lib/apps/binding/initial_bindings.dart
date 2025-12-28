import 'package:dhuwitku/apps/controller/network_controller.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/data/datasource/bottom_nav_bar_network_datasource.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/data/repositories/bottom_nav_bar_repository_impl.dart';
import 'package:dhuwitku/apps/features/splash_screen/presentation/controller/splash_screen_controller.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkController(), permanent: true);
    Get.put(SplashScreenController());

    Get.lazyPut(() => BottomNavBarRepositoryImpl(), fenix: true);
    Get.lazyPut(() => BottomNavBarNetworkDatasource(), fenix: true);
  }
}
