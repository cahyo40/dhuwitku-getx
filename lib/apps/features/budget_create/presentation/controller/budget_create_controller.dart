import 'package:dhuwitku/apps/data/model/budget_model.dart';
import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart'
    show FormState, GlobalKey, TextEditingController;
import 'package:get/get.dart';

class BudgetCreateController extends GetxController {
  // State
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();

  final budgetId = RxnString();
  final isCreate = RxBool(false);

  final selectedCategory = Rxn<CategoryModel>();
  final categories = RxList<CategoryModel>();
  final categoriesFiltered = RxList<CategoryModel>();
  final budgetType = BudgetType.expense.obs;

  final formKey = GlobalKey<FormState>();
  final amount = TextEditingController();
  final name = TextEditingController();
  final startDate = DateTime.now().obs;
  final endDate = DateTime.now().obs;
  final description = TextEditingController();
  final category = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    amount.dispose();
    name.dispose();
    description.dispose();
    category.dispose();
  }

  void onFilterCategories() {
    categoriesFiltered.value = categories
        .where((element) => element.type.name == budgetType.value.name)
        .toList();
    if (isCreate.value == true) {
      onResetForm();
    }
  }

  @override
  void onInit() {
    budgetId.value = Get.arguments['budgetId'];
    isCreate.value = Get.arguments['isCreate'];
    super.onInit();
    _loadData();
  }

  void onResetForm() {
    formKey.currentState?.reset();
    name.clear();
    startDate.value = DateTime.now();
    endDate.value = DateTime.now();
    description.clear();
    category.clear();
    selectedCategory.value = null;
  }

  Future<void> retry() async {
    await _loadData();
  }

  Future<void> _loadData() async {
    try {
      isLoading.value = true;
      error.value = null;
      categories.value = Get.find<BottomNavBarController>().categories;

      await Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
