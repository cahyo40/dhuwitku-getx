import 'package:dhuwitku/apps/core/network/firebase_collection.dart';
import 'package:dhuwitku/apps/features/category/domain/repositories/category_repository.dart';
import 'package:yo_ui/yo_ui.dart';

class CategoryNetworkDatasource implements CategoryRepository {
  // final Dio _dio;

  CategoryNetworkDatasource();

  @override
  Future<void> deleteCategory(String id) async {
    try {
      await categoryCollection.doc(id).delete();
    } catch (e, s) {
      YoLogger.error("$e -> $s");
      throw Exception(e);
    }
  }
}
