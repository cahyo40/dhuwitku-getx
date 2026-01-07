import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:dhuwitku/apps/features/category/domain/usecase/delete_category_usecase.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  // State
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();

  final RxList<CategoryModel> categories = <CategoryModel>[].obs;
  final RxList<CategoryModel> categoriesFilter = <CategoryModel>[].obs;

  final RxList<TransactionModel> transactions = <TransactionModel>[].obs;

  final getTransactions = Get.find<BottomNavBarController>().getTransactions;
  final getCategories = Get.find<BottomNavBarController>().getCategories;

  List<String> filterCategory = ["all", "expense", "income"];

  final RxInt categoryType = 0.obs;

  final deleteCategory = DeleteCategoryUsecase(Get.find());

  void onDeleteCategory(String id) {
    deleteCategory.call(id);
  }

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  Future<void> retry() async {
    categoryType.value = 0;
    await _loadData();
  }

  void toggleCategoryType(int index) {
    categoryType.value = index;
    if (categoryType.value == 0) {
      categoriesFilter.value = categories;
    } else {
      categoriesFilter.value = categories
          .where((e) => e.type.name == filterCategory[categoryType.value])
          .toList();
    }
  }

  Future<void> _loadData() async {
    try {
      isLoading.value = true;
      error.value = null;

      final res = await Future.wait([getCategories(), getTransactions()]);
      categories.value = res[0] as List<CategoryModel>;
      transactions.value = res[1] as List<TransactionModel>;
      categoriesFilter.value = categories;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
