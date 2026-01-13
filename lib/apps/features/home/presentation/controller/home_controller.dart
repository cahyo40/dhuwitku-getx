import 'package:dhuwitku/apps/data/model/budget_response_model.dart';
import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/data/model/summary_model.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

class HomeController extends GetxController {
  // State
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();

  final RxList<TransactionModel> transactions = <TransactionModel>[].obs;
  final RxList<BudgetResponseModel> budgets = <BudgetResponseModel>[].obs;
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;
  final Rxn<SummaryModel> summary = Rxn<SummaryModel>();

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  Future<void> retry() async {
    await _loadData(useLoading: false);
  }

  Future<void> _loadData({bool useLoading = true}) async {
    isLoading.value = useLoading;
    try {
      error.value = null;
      budgets.value = Get.find<BottomNavBarController>().budgets;
      transactions.value = Get.find<BottomNavBarController>().transactions;
      categories.value = Get.find<BottomNavBarController>().categories;
      summary.value = Get.find<BottomNavBarController>().summaries.value;
    } catch (e, s) {
      YoLogger.error("$e -> $s");
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
