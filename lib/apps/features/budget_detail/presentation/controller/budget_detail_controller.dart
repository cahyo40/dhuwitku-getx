import 'package:dhuwitku/apps/data/model/budget_response_model.dart';
import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:get/get.dart';

class BudgetDetailController extends GetxController {
  // State
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();
  final Rxn<BudgetResponseModel> budget = Rxn<BudgetResponseModel>();
  final RxList<CategoryModel> categories = RxList<CategoryModel>();

  // usecase

  @override
  void onClose() {
    // TODO: Dispose resources
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  Future<void> retry() async {
    await _loadData();
  }

  Future<void> _loadData() async {
    try {
      isLoading.value = true;
      error.value = null;

      final args = Get.arguments;
      final data = args['data'] as BudgetResponseModel;
      budget.value = data;
      categories.value = await Get.find<BottomNavBarController>()
          .getCategories();
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
