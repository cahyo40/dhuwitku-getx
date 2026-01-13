import 'package:dhuwitku/apps/controller/auth_controller.dart';
import 'package:dhuwitku/apps/data/model/budget_response_model.dart';
import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/data/model/summary_model.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/domain/usecase/get_budgets_usecase.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/domain/usecase/get_categories_usecase.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/domain/usecase/get_summaries_usecase.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/domain/usecase/get_transactions_usecase.dart';
import 'package:dhuwitku/apps/features/budget/presentation/controller/budget_controller.dart';
import 'package:dhuwitku/apps/features/home/presentation/controller/home_controller.dart';
import 'package:dhuwitku/apps/features/report/presentation/controller/report_controller.dart';
import 'package:dhuwitku/apps/features/settings/presentation/controller/settings_controller.dart';
import 'package:dhuwitku/apps/features/transaction/presentation/controller/transaction_controller.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

AuthController get auth => Get.find<AuthController>();

class BottomNavBarController extends GetxController {
  // State
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();

  final uid = auth.uid.obs;
  // Usecase

  final getTransactions = GetTransactionsUsecase(Get.find());
  final getBudgets = GetBudgetsUsecase(Get.find());
  final getCategories = GetCategoriesUsecase(Get.find());
  final getSummaries = GetSummariesUsecase(Get.find());
  // Data
  final transactions = <TransactionModel>[].obs;
  final budgets = <BudgetResponseModel>[].obs;
  final categories = <CategoryModel>[].obs;
  final Rxn<SummaryModel> summaries = Rxn<SummaryModel>();

  final currentPage = 0.obs;

  List controllers = [
    Get.find<HomeController>(),
    Get.find<TransactionController>(),
    Get.find<BudgetController>(),
    Get.find<ReportController>(),
    Get.find<SettingsController>(),
  ];

  void onChangePage(int index) {
    currentPage.value = index;
    if (index == 1) {
      Get.find<TransactionController>().retry();
    } else if (index == 2) {
      Get.find<BudgetController>().retry(useLoading: true);
    } else if (index == 3) {
      Get.find<ReportController>().retry();
    } else if (index == 4) {
      Get.find<SettingsController>().retry();
    } else {
      retry();
    }
  }

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  Future<void> retry() async {
    YoLogger.info("Retry BottomController");
    await _loadData(useLoading: false);
  }

  Future<void> _loadData({bool useLoading = true}) async {
    isLoading.value = useLoading;
    try {
      final res = await Future.wait([
        getTransactions.call(),
        getBudgets.call(),
        getCategories.call(),
        getSummaries.call(),
      ]);
      transactions.value = res[0] as List<TransactionModel>;
      budgets.value = res[1] as List<BudgetResponseModel>;
      categories.value = res[2] as List<CategoryModel>;
      summaries.value = res[3] as SummaryModel;
      error.value = null;
    } catch (e, s) {
      YoLogger.error("$e -> $s");
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
