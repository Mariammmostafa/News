import 'package:newss_app/features/category_news/data/models/source_model.dart';
import 'package:newss_app/features/category_news/domain/entities/source_data.dart';

class SourceModelMapper {
  static SourceData toEntity(SourceModel model) {
    return SourceData(
      id: model.id ?? "-1",
      name: model.name ?? "No Name Found",
    );
  }
}
