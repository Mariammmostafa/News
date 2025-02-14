import 'package:newss_app/core/api/api_result.dart';
import 'package:newss_app/features/category_news/domain/entities/source_data.dart';

abstract class CategoriesNewsRepo {
  Future<ApiResult<List<SourceData>>> getSources(String category);
}
