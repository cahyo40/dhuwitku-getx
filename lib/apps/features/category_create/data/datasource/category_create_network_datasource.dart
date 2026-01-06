import 'package:dhuwitku/apps/core/network/firebase_collection.dart';
import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/features/category_create/domain/repositories/category_create_repository.dart';
import 'package:yo_ui/yo_ui.dart';

class CategoryCreateNetworkDatasource implements CategoryCreateRepository {
  // final Dio _dio;

  CategoryCreateNetworkDatasource();

  @override
  Future<void> createCategory(CategoryModel category) async {
    try {
      final data = category.toJson();
      // Convert DateTime to Timestamp for Firestore
      // data['createdAt'] = Timestamp.fromDate(category.createdAt);
      // Explicitly convert IconModel to JSON (nested freezed object)
      data['icon'] = category.icon.toJson();
      await categoryCollection.doc(category.id).set(data);
    } catch (e, s) {
      YoLogger.error("Error create category: $e -> $s");
      throw Exception(e);
    }
  }
}
