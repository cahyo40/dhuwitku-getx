import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/data/model/icon_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:dhuwitku/apps/features/category_create/domain/usecase/category_create_usecase.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

class CategoryCreateController extends GetxController {
  // State
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();

  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final type = CategoryType.expense.obs;
  final iconSelected = Rxn<IconModel>();
  final colorSelected = RxnInt();

  // UseCase
  final create = CategoryCreateUsecase(Get.find());

  // Lifecycle

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

  // Actions

  void onReset() {
    formKey.currentState?.reset();
    name.clear();
    type.value = CategoryType.expense;
    iconSelected.value = null;
    colorSelected.value = null;
  }

  void onSelectColor(int color) {
    colorSelected.value = color;
  }

  void onSelectIcon(IconModel icon) {
    iconSelected.value = icon;
  }

  void onSelectType(CategoryType type) {
    this.type.value = type;
  }

  void onSubmit() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      try {
        final id = YoIdGenerator.alphanumericId();
        final createdAt = DateTime.now();
        if (iconSelected.value == null) {
          YoSnackBar.error(Get.context!, "Please select an icon");
          return;
        }

        final data = CategoryModel(
          id: id,
          budgetId: auth.uid,
          name: name.text.trim(),
          type: type.value,
          icon: iconSelected.value!,
          color: colorSelected.value ?? primaryColor.toARGB32(),
          createdAt: createdAt,
        );
        await create.call(data);
        YoSnackBar.success(Get.context!, "Category created successfully");
        onReset();
      } catch (e) {
        YoLogger.error(e.toString());
        YoSnackBar.error(Get.context!, "Failed to create category");
      } finally {
        isLoading.value = false;
        Get.back(result: true);
      }
    }
  }

  // Utils

  Future<void> retry() async {
    await _loadData();
  }

  Future<void> _loadData({bool useLoading = true}) async {
    try {
      isLoading.value = useLoading;
      error.value = null;

      // TODO: Load data from usecase
      await Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
