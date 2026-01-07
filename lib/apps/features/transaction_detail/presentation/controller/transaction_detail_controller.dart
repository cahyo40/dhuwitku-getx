import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/domain/usecase/get_categories_usecase.dart';
import 'package:dhuwitku/apps/features/transaction_detail/domain/usecase/delete_transaction_usecase.dart';
import 'package:dhuwitku/apps/features/transaction_detail/domain/usecase/get_category_usecase.dart';
import 'package:dhuwitku/apps/features/transaction_detail/domain/usecase/get_transaction_usecase.dart';
import 'package:dhuwitku/apps/features/transaction_detail/domain/usecase/update_transaction_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

class TransactionDetailController extends GetxController {
  // State
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();

  final RxBool isEdit = false.obs;

  final RxString id = RxString('');
  final RxString categoryId = RxString('');
  final RxString budgetId = RxString('');
  final categories = <CategoryModel>[].obs;
  final categoriesFilter = <CategoryModel>[].obs;

  final getTransaction = GetTransactionUsecase(Get.find());
  final getCategory = GetCategoryUsecase(Get.find());
  final deleteTransaction = DeleteTransactionUsecase(Get.find());
  final updateTransaction = UpdateTransactionUsecase(Get.find());
  final GetCategoriesUsecase getCategoriesUsecase = GetCategoriesUsecase(
    Get.find(),
  );

  final Rxn<TransactionModel> transaction = Rxn<TransactionModel>();
  final Rxn<CategoryModel> category = Rxn<CategoryModel>();

  final formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final noteController = TextEditingController();
  final descriptionController = TextEditingController();
  final categoryController = TextEditingController();
  final budgetController = TextEditingController();
  final Rx<TransactionType> transactionType = TransactionType.expense.obs;

  @override
  void onClose() {
    // TODO: Dispose resources
    super.onClose();
  }

  void onDeleteTransaction() {
    deleteTransaction.call(id.value);
  }

  @override
  void onInit() {
    super.onInit();
    id.value = Get.arguments['id'];
    categoryId.value = Get.arguments['category_id'];
    budgetId.value = Get.arguments['budget_id'];
    _loadData();
  }

void onUpdate() {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      try {
        final data = TransactionModel(
          id: id.value,
          name: noteController.text,
          amount: int.parse(amountController.text),
          type: transactionType.value,
          categoryId: category.value!.id,
          budgetId: budgetId.value,
          description: descriptionController.text,
          uid: transaction.value!.uid,
          date: transaction.value!.date,
          createdAt: transaction.value!.createdAt,
          updatedAt: DateTime.now(),
        );
        updateTransaction.call(data);
        Get.back(result: true);
      } catch (e) {
        YoSnackBar.error(Get.context!, e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> retry() async {
    await _loadData();
  }

  void toggleEdit() {
    isEdit.value = !isEdit.value;
    if (isEdit.isTrue) {
      amountController.text = transaction.value?.amount.toString() ?? "0";
    } else {
      amountController.text = YoCurrencyFormatter.formatCurrency(
        transaction.value?.amount.toDouble() ?? 0.0,
      );
    }
  }

  Future<void> _loadData() async {
    try {
      isLoading.value = true;
      error.value = null;
      final res = await Future.wait([
        getTransaction.call(id.value),
        getCategory.call(categoryId.value),
        getCategoriesUsecase.call(),
      ]);
      transaction.value = res[0] as TransactionModel;
      category.value = res[1] as CategoryModel;
      categories.value = res[2] as List<CategoryModel>;
      categoriesFilter.value = categories
          .where(
            (e) =>
                e.type.name.toLowerCase() ==
                transactionType.value.name.toLowerCase(),
          )
          .toList();

      amountController.text = YoCurrencyFormatter.formatCurrency(
        transaction.value?.amount.toDouble() ?? 0.0,
      );
      noteController.text = transaction.value?.name ?? "";
      descriptionController.text = transaction.value?.description ?? "";
      budgetController.text = transaction.value?.budgetId ?? "";
      categoryController.text = category.value?.name ?? "";
      transactionType.value =
          transaction.value?.type ?? TransactionType.expense;

      await Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
