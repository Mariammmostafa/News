import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newss_app/core/api/web_service.dart';
import 'package:newss_app/features/category_news/data/data_source/category_news_remote_data_source.dart';
import 'package:newss_app/features/category_news/data/repos/categories_news_repo_impl.dart';
import 'package:newss_app/features/category_news/ui/cubit/category_news_cubit.dart';
import 'package:newss_app/features/category_news/ui/widgets/categories_body_widget.dart';

class CategoryNewsScreen extends StatelessWidget {
  final String categoryName;

  const CategoryNewsScreen({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryNewsCubit(
        CategoriesNewsRepoImpl(
          CategoryNewsRemoteDataSource(WebService.instance),
        ),
      )..loadSources(categoryName),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<CategoryNewsCubit, CategoryNewsState>(
          builder: (context, state) {
            if (state is CategoryNewsInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CategoryNewsLoadded) {
              return const CategoriesBodyWidget();
            }
            if (state is CategoryNewsFailuer) {
              return Text(state.message);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
