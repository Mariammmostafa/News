import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newss_app/core/api/api_result.dart';
import 'package:newss_app/features/category_news/domain/entities/source_data.dart';
import 'package:newss_app/features/category_news/domain/repos/categories_news_repo.dart';

part 'category_news_state.dart';

class CategoryNewsCubit extends Cubit<CategoryNewsState> {
  CategoryNewsCubit(this._categoriesNewsRepo) : super(CategoryNewsInitial());

  final CategoriesNewsRepo _categoriesNewsRepo;
  List<SourceData> sources = [];

  loadSources(String categoryName) async {
    log("enter");
    var result = await _categoriesNewsRepo.getSources(categoryName);
    switch (result) {
      case SuccessRequest<List<SourceData>>():
        sources = result.data;
        emit(CategoryNewsLoadded());
      case FailureRequest():
        emit(
          CategoryNewsFailuer(message: result.exception.message ?? ""),
        );
    }
  }
}
