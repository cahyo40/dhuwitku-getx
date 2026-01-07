import 'package:dhuwitku/apps/data/dummy_data.dart';
import 'package:dhuwitku/apps/data/model/budget_model.dart';
import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/domain/usecase/get_budgets_usecase.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/domain/usecase/get_categories_usecase.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:dhuwitku/apps/features/transaction_create/domain/usecase/transaction_create_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

class TransactionCreateController extends GetxController {
  // State
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();
  // Data
  final categories = <CategoryModel>[].obs;
  final categoriesFilter = <CategoryModel>[].obs;
  final budgets = <BudgetModel>[].obs;

  // Usecase
  final GetCategoriesUsecase getCategoriesUsecase = GetCategoriesUsecase(
    Get.find(),
  );
  final GetBudgetsUsecase getBudgetsUsecase = GetBudgetsUsecase(Get.find());
  final create = TransactionCreateUsecase(Get.find());

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

  CategoryModel get defaultCategory =>
      transactionType.value == TransactionType.expense
      ? defaultExpenseCategories
      : defaultIncomeCategories;

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
    categoriesFilter.value = categories
        .where(
          (e) =>
              e.type.name.toLowerCase() ==
              transactionType.value.name.toLowerCase(),
        )
        .toList();
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

  void onSave() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      try {
        final data = TransactionModel(
          id: YoIdGenerator.transactionId(length: 16),
          uid: auth.uid,
          name: title.text,
          amount: int.parse(amount.text.replaceAll(",", "")),
          type: transactionType.value,
          categoryId: selectedCategory.value?.id ?? defaultCategory.id,
          date: selectedDate.value,
          description: description.text,
          budgetId: budgetId.value ?? "",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await create.call(data);
      } catch (e, s) {
        YoLogger.error("$e -> $s");
        error.value = e.toString();
      } finally {
        isLoading.value = false;
        Get.back(result: true);
      }
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
      final res = await Future.wait([
        getBudgetsUsecase.call(),
        getCategoriesUsecase.call(),
      ]);
      budgets.value = res[0] as List<BudgetModel>;
      categories.value = res[1] as List<CategoryModel>;
      categoriesFilter.value = categories
          .where(
            (e) =>
                e.type.name.toLowerCase() ==
                transactionType.value.name.toLowerCase(),
          )
          .toList();
    } catch (e, s) {
      YoLogger.error("$e-> $s");
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
