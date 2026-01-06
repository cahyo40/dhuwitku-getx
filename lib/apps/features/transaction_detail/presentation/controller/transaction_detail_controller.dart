import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:dhuwitku/apps/features/transaction_detail/domain/usecase/delete_transaction_usecase.dart';
import 'package:dhuwitku/apps/features/transaction_detail/domain/usecase/get_category_usecase.dart';
import 'package:dhuwitku/apps/features/transaction_detail/domain/usecase/get_transaction_usecase.dart';
import 'package:dhuwitku/apps/features/transaction_detail/domain/usecase/update_transaction_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionDetailController extends GetxController {
  // State
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();

  final RxBool isEdit = false.obs;

  final RxString id = RxString('');
  final RxString categoryId = RxString('');
  final RxString budgetId = RxString('');

  final getTransaction = GetTransactionUsecase(Get.find());
  final getCategory = GetCategoryUsecase(Get.find());
  final deleteTransaction = DeleteTransactionUsecase(Get.find());
  final updateTransaction = UpdateTransactionUsecase(Get.find());

  final Rxn<TransactionModel> transaction = Rxn<TransactionModel>();
  final Rxn<CategoryModel> category = Rxn<CategoryModel>();

  final formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final noteController = TextEditingController();
  final descriptionController = TextEditingController();
  final budgetController = TextEditingController();

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
      updateTransaction.call(transaction.value!);
    }
  }

  Future<void> retry() async {
    await _loadData();
  }

  void toggleEdit() => isEdit.value = !isEdit.value;


  Future<void> _loadData() async {
    try {
      isLoading.value = true;
      error.value = null;
      final res = await Future.wait([
        getTransaction.call(id.value),
        getCategory.call(categoryId.value),
      ]);
      transaction.value = res[0] as TransactionModel;
      category.value = res[1] as CategoryModel;

      amountController.text = transaction.value?.amount.toString() ?? "0";
      noteController.text = transaction.value?.name ?? "";
      descriptionController.text = transaction.value?.description ?? "";
      budgetController.text = transaction.value?.budgetId ?? "";

      await Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
