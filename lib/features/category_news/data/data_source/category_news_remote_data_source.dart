import 'package:dio/dio.dart';
import 'package:newss_app/core/api/endpoints.dart';
import 'package:newss_app/core/api/web_service.dart';

class CategoryNewsRemoteDataSource {
  final WebService _webService;

  CategoryNewsRemoteDataSource(this._webService);

  Future<Response> getCategorySources(String category) async {
    return _webService.get(
      Endpoints.sources,
      queryParameters: {
        'category': category,
      },
    );
  }

  Future<Response> getSourceArticles(String sourceId) {
    return _webService.get(
      Endpoints.articles,
      queryParameters: {
        'sources': sourceId,
      },
    );
  }
}
