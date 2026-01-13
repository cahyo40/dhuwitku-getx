import 'package:dhuwitku/apps/data/model/budget_response_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/domain/usecase/get_budgets_usecase.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

class BudgetController extends GetxController {
  // State
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();

  // data
  final RxList<BudgetResponseModel> budgets = RxList<BudgetResponseModel>();
  final RxList<BudgetResponseModel> budgetsFiltered =
      RxList<BudgetResponseModel>();

  // use case
  final getBudgetsUsecase = GetBudgetsUsecase(Get.find());

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  Future<void> retry({bool useLoading = false}) async {
    await _loadData(useLoading: useLoading);
  }

  Future<void> _loadData({bool useLoading = true}) async {
    YoLogger.info("_loadData Budget Controller");
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
