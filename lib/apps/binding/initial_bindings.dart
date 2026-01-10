import 'package:dhuwitku/apps/controller/network_controller.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/data/datasource/bottom_nav_bar_network_datasource.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/data/repositories/bottom_nav_bar_repository_impl.dart';
import 'package:dhuwitku/apps/features/budget_create/data/datasource/budget_create_network_datasource.dart';
import 'package:dhuwitku/apps/features/budget_create/data/repositories/budget_create_repository_impl.dart';
import 'package:dhuwitku/apps/features/category/data/datasource/category_network_datasource.dart';
import 'package:dhuwitku/apps/features/category/data/repositories/category_repository_impl.dart';
import 'package:dhuwitku/apps/features/category_create/data/datasource/category_create_network_datasource.dart';
import 'package:dhuwitku/apps/features/category_create/data/repositories/category_create_repository_impl.dart';
import 'package:dhuwitku/apps/features/splash_screen/presentation/controller/splash_screen_controller.dart';
import 'package:dhuwitku/apps/features/transaction_create/data/datasource/transaction_create_network_datasource.dart';
import 'package:dhuwitku/apps/features/transaction_create/data/repositories/transaction_create_repository_impl.dart';
import 'package:dhuwitku/apps/features/transaction_detail/data/datasource/transaction_detail_network_datasource.dart';
import 'package:dhuwitku/apps/features/transaction_detail/data/repositories/transaction_detail_repository_impl.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkController(), permanent: true);
    Get.put(SplashScreenController());

    Get.lazyPut(
      () => BottomNavBarRepositoryImpl(BottomNavBarNetworkDatasource()),
      fenix: true,
    );
    Get.lazyPut(() => BottomNavBarNetworkDatasource(), fenix: true);

    Get.lazyPut(
      () => CategoryCreateRepositoryImpl(CategoryCreateNetworkDatasource()),
      fenix: true,
    );
    Get.lazyPut(() => CategoryCreateNetworkDatasource(), fenix: true);

    Get.lazyPut(
      () =>
          TransactionCreateRepositoryImpl(TransactionCreateNetworkDatasource()),
      fenix: true,
    );
    Get.lazyPut(() => TransactionCreateNetworkDatasource(), fenix: true);

    Get.lazyPut(
      () =>
          TransactionDetailRepositoryImpl(TransactionDetailNetworkDatasource()),
      fenix: true,
    );
    Get.lazyPut(() => TransactionDetailNetworkDatasource(), fenix: true);

    Get.lazyPut(
      () => CategoryRepositoryImpl(CategoryNetworkDatasource()),
      fenix: true,
    );
    Get.lazyPut(() => CategoryNetworkDatasource(), fenix: true);

    Get.lazyPut(
      () => BudgetCreateRepositoryImpl(BudgetCreateNetworkDatasource()),
      fenix: true,
    );
    Get.lazyPut(() => BudgetCreateNetworkDatasource(), fenix: true);
  }
}
