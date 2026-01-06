import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  // State
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();

  final filter = ["all", ...TransactionType.values.map((e) => e.name)];
  final currentFilter = 0.obs;

  final RxList<TransactionModel> transactions = <TransactionModel>[].obs;
  final RxList<TransactionModel> filteredTransactions =
      <TransactionModel>[].obs;

  void changeFilter(int index) {
    currentFilter.value = index;

    if (index == 0) {
      filteredTransactions.value = transactions;
    } else {
      filteredTransactions.value = transactions
          .where((e) => e.type == TransactionType.values[index - 1])
          .toList();
    }
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
      transactions.value = Get.find<BottomNavBarController>().transactions;
      filteredTransactions.value = transactions;
      await Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
