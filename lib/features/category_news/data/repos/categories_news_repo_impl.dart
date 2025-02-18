import 'package:dio/dio.dart';
import 'package:newss_app/core/api/api_result.dart';
import 'package:newss_app/core/errors/global_error_handler.dart';
import 'package:newss_app/features/category_news/data/data_source/category_news_remote_data_source.dart';
import 'package:newss_app/features/category_news/data/mappers/articel_model_mapper.dart';
import 'package:newss_app/features/category_news/data/mappers/source_model_mapper.dart';
import 'package:newss_app/features/category_news/data/models/get_category_sources_response_body.dart';
import 'package:newss_app/features/category_news/data/models/get_source_articles_response_body.dart';
import 'package:newss_app/features/category_news/domain/entities/article_data.dart';
import 'package:newss_app/features/category_news/domain/entities/source_data.dart';
import 'package:newss_app/features/category_news/domain/repos/categories_news_repo.dart';

class CategoriesNewsRepoImpl extends CategoriesNewsRepo {
  final CategoryNewsRemoteDataSource _categoryNewsRemoteDataSource;

  CategoriesNewsRepoImpl(this._categoryNewsRemoteDataSource);

  @override
  Future<ApiResult<List<SourceData>>> getSources(String category) async {
    try {
      var response =
          await _categoryNewsRemoteDataSource.getCategorySources(category);

      var model = GetCategorySourcesResponseBody.fromJson(response.data);

      List<SourceData> sources = [];

      for (var sourceModel in model.sources) {
        var sourceEntity = SourceModelMapper.toEntity(sourceModel);
        sources.add(sourceEntity);
      }

      return ApiResult.success(data: sources);
    } on DioException catch (e) {
      return ApiResult.failure(
        exception: GlobalErrorHandler.fromDioException(e),
      );
    } on Exception catch (e) {
      return ApiResult.failure(
        exception: GlobalErrorHandler.fromException(e),
      );
    }
  }

  @override
  Future<ApiResult<List<ArticleData>>> getSourceArticles(
      String sourceId) async {
    try {
      var response =
          await _categoryNewsRemoteDataSource.getSourceArticles(sourceId);

      var model = GetSourceArticlesResponseBody.fromJson(response.data);

      List<ArticleData> articles = [];

      for (var articleModel in model.articles) {
        var sourceEntity = ArticelModelMapper.toEntity(articleModel);
        articles.add(sourceEntity);
      }

      return ApiResult.success(data: articles);
    } on DioException catch (e) {
      return ApiResult.failure(
        exception: GlobalErrorHandler.fromDioException(e),
      );
    } on Exception catch (e) {
      return ApiResult.failure(
        exception: GlobalErrorHandler.fromException(e),
      );
    }
  }
}
