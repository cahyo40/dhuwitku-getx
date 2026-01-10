import 'package:dhuwitku/apps/data/dummy_data.dart';
import 'package:dhuwitku/apps/data/model/budget_model.dart';
import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/data/model/icon_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:dhuwitku/apps/features/budget_create/domain/usecase/create_budget_usecase.dart';
import 'package:dhuwitku/apps/features/budget_create/domain/usecase/delete_budget_usecase.dart';
import 'package:dhuwitku/apps/features/budget_create/domain/usecase/detail_budget_usecase.dart';
import 'package:dhuwitku/apps/features/budget_create/domain/usecase/update_budget_usecase.dart';
import 'package:flutter/material.dart'
    show FormState, GlobalKey, TextEditingController;
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

class BudgetCreateController extends GetxController {
  // State
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();

  // Data
  final budgetId = RxnString();
  final budget = Rxn<BudgetModel>();
  final isCreate = RxBool(false);
  //usecase
  final createBudgetUsecase = CreateBudgetUsecase(Get.find());
  final deleteBudgetUsecase = DeleteBudgetUsecase(Get.find());
  final updateBudgetUsecase = UpdateBudgetUsecase(Get.find());
  final getBudgetUsecase = DetailBudgetUsecase(Get.find());
  final getCtagory = Get.find<BottomNavBarController>().getCategories;

  // Form
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

  List<String> dateTypes = ["type_month", "type_custom"];

  RxInt selectedDateType = 0.obs;

  Future<void> getBudget() async {
    if (budgetId.value != null) {
      final data = await getBudgetUsecase.call(budgetId.value!);
      final ctg = categories.firstWhere(
        (element) => element.id == data.categoryId,
      );
      budget.value = data;
      name.text = data.name;
      amount.text = data.amount.toString();
      description.text = data.description ?? "";
      category.text = ctg.name;
      selectedCategory.value = ctg;
      startDate.value = data.startDate;
      endDate.value = data.endDate;
    }
  }

  IconModel getIcon() {
    if (budgetType.value == BudgetType.expense) {
      return defaultIconExpense;
    } else {
      return defaultIconIncome;
    }
  }

  @override
  void onClose() {
    super.onClose();
    amount.dispose();
    name.dispose();
    description.dispose();
    category.dispose();
  }

  void onCreateBudget() {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      try {
        final id = YoIdGenerator.alphanumericId();
        final data = BudgetModel(
          id: id,
          uid: auth.uid,
          name: name.text,
          isPrivate: true,
          type: budgetType.value,
          amount: int.parse(amount.text),
          icon: selectedCategory.value?.icon ?? getIcon(),
          startDate: startDate.value,
          endDate: endDate.value,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        createBudgetUsecase.call(data);
      } catch (e, s) {
        YoLogger.error("$e -> $s");
        YoSnackBar.error(Get.context!, e.toString());
      } finally {
        isLoading.value = false;
        Get.back(result: "create");
      }
    }
  }

  void onDeleteBudget() {
    if (budgetId.value != null) {
      deleteBudgetUsecase.call(budgetId.value!);
      Get.back(result: "delete");
    }
  }

  void onFilterCategories(BudgetType type) {
    budgetType.value = type;
    categoriesFiltered.value = categories
        .where((element) => element.type.name == budgetType.value.name)
        .toList();
    YoLogger.info("${categoriesFiltered.length}");
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

  void onSubmitBudget() {
    if (isCreate.value == true) {
      onCreateBudget();
    } else {
      onUpdateBudget();
    }
  }

  void onToggleDateType(int index) {
    selectedDateType.value = index;
  }

  void onUpdateBudget() {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      try {
        final data = BudgetModel(
          id: budgetId.value!,
          uid: budget.value?.uid ?? auth.uid,
          name: name.text,
          isPrivate: true,
          type: budgetType.value,
          amount: int.parse(amount.text),
          icon: selectedCategory.value?.icon ?? budget.value?.icon ?? getIcon(),
          startDate: startDate.value,
          endDate: endDate.value,
          createdAt: budget.value?.createdAt ?? DateTime.now(),
          updatedAt: DateTime.now(),
        );
        updateBudgetUsecase.call(data);
      } catch (e, s) {
        YoLogger.error("$e -> $s");
        YoSnackBar.error(Get.context!, e.toString());
      } finally {
        isLoading.value = false;
        Get.back(result: "update");
      }
    }
  }

  Future<void> retry() async {
    await _loadData();
  }

  Future<void> _loadData() async {
    try {
      isLoading.value = true;
      error.value = null;
      categories.value = await getCtagory();
      YoLogger.info("${categories.length}");
      categoriesFiltered.value = categories
          .where((element) => element.type.name == budgetType.value.name)
          .toList();
      YoLogger.info("${categoriesFiltered.length}");

      await Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
