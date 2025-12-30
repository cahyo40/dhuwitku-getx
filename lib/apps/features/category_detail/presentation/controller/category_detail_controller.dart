import 'package:get/get.dart';

class CategoryDetailController extends GetxController {
  // State
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      isLoading.value = true;
      error.value = null;
      
      // TODO: Load data from usecase
      await Future.delayed(const Duration(milliseconds: 500));
      
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> retry() async {
    await _loadData();
  }

  @override
  void onClose() {
    // TODO: Dispose resources
    super.onClose();
  }
}
