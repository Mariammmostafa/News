import 'article_model.dart';

class GetSourceArticlesResponseBody {
  GetSourceArticlesResponseBody({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String? status;
  final num? totalResults;
  final List<ArticleModel> articles;

  factory GetSourceArticlesResponseBody.fromJson(Map<String, dynamic> json) {
    return GetSourceArticlesResponseBody(
      status: json["status"],
      totalResults: json["totalResults"],
      articles: json["articles"] == null
          ? []
          : List<ArticleModel>.from(
              json["articles"]!.map(
                (x) => ArticleModel.fromJson(x),
              ),
            ),
    );
  }
}
