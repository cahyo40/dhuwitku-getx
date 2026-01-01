import 'package:dhuwitku/apps/data/model/budget_model.dart';
import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

class TransactionCreateController extends GetxController {
  // State
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();
  // Data
  final categories = <CategoryModel>[].obs;
  final budgets = <BudgetModel>[].obs;

  // Form

  final formKey = GlobalKey<FormState>();
  final Rx<TransactionType> transactionType = TransactionType.expense.obs;
  final amount = TextEditingController();
  final title = TextEditingController();
  final dateController = TextEditingController();
  final selectedCategory = Rxn<CategoryModel>();
  final categoryController = TextEditingController();
  final selectedDate = DateTime.now().obs;
  final description = TextEditingController();
  final budgetId = Rxn<String>();
  final budgetController = TextEditingController();

  void onChangeBudgetId(BudgetModel budget) {
    budgetId.value = budget.id;
    budgetController.text = budget.name;
  }

  void onChangeSelectedCategory(CategoryModel category) {
    selectedCategory.value = category;
    categoryController.text = category.name;
  }

  void onChangeSelectedDate(DateTime date) {
    selectedDate.value = date;
    dateController.text = YoDateFormatter.formatDate(date);
  }

  void onChangeTransactionType(TransactionType type) {
    transactionType.value = type;
    onReset();
  }

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

  void onReset() {
    formKey.currentState!.reset();
    selectedCategory.value = null;
    categoryController.clear();
    description.clear();
    amount.clear();
    title.clear();
    selectedDate.value = DateTime.now();
    dateController.text = YoDateFormatter.formatDate(selectedDate.value);
    budgetId.value = null;
    budgetController.clear();
  }

  void onSave() {
    isLoading.value = true;
    try {
      if (formKey.currentState!.validate()) {}
    } catch (e, s) {
      YoLogger.error("$e -> $s");
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> retry() async {
    await _loadData();
  }

  Future<void> _loadData({bool useLoading = true}) async {
    try {
      isLoading.value = useLoading;
      error.value = null;
      dateController.text = YoDateFormatter.formatDate(selectedDate.value);
      await Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
