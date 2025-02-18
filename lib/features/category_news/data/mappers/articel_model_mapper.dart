import 'package:newss_app/features/category_news/domain/entities/article_data.dart';

import '../models/article_model.dart';

class ArticelModelMapper {
  static ArticleData toEntity(ArticleModel model) {
    return ArticleData(
      author: model.author ?? "",
      title: model.title ?? "",
      description: model.description ?? "",
      url: model.url ?? "",
      urlToImage: model.urlToImage ?? "",
      publishedAt: model.publishedAt,
      content: model.content ?? "",
    );
  }
}
