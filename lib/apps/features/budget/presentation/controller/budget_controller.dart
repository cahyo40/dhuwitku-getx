import 'package:dhuwitku/apps/data/model/budget_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:get/get.dart';

class BudgetController extends GetxController {
  // State
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();

  // data
  final RxList<BudgetModel> budgets = RxList<BudgetModel>();
  final RxList<BudgetModel> budgetsFiltered = RxList<BudgetModel>();

  // use case
  final getBudgetsUsecase = Get.find<BottomNavBarController>().getBudgets;

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  Future<void> retry({bool useLoading = false}) async {
    await _loadData(useLoading: useLoading);
  }

  Future<void> _loadData({bool useLoading = true}) async {
    try {
      isLoading.value = useLoading;
      error.value = null;

      final res = await Future.wait([getBudgetsUsecase.call()]);
      budgets.value = res[0];
      budgetsFiltered.value = budgets;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
