import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newss_app/core/extensions/context_extension.dart';
import 'package:newss_app/core/extensions/number_extension.dart';
import 'package:newss_app/core/theme/app_colors.dart';
import 'package:newss_app/features/category_news/ui/cubit/category_news_cubit.dart';

import 'article_card.dart';

class CategoriesBodyWidget extends StatefulWidget {
  const CategoriesBodyWidget({
    super.key,
  });

  @override
  State<CategoriesBodyWidget> createState() => _CategoriesBodyWidgetState();
}

class _CategoriesBodyWidgetState extends State<CategoriesBodyWidget> {
  late CategoryNewsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<CategoryNewsCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryNewsCubit, CategoryNewsState>(
      builder: (context, state) {
        return DefaultTabController(
          length: _cubit.sources.length,
          child: Column(
            children: [
              TabBar(
                labelColor: context.isDark ? Colors.white : AppColors.black,
                indicatorColor: AppColors.black,
                dividerColor: Colors.transparent,
                unselectedLabelColor: Colors.grey,
                padding: EdgeInsets.zero,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                onTap: (index) {
                  _cubit.loadSourceArticles(_cubit.sources[index].id);
                },
                tabs: _cubit.sources.map(
                  (e) {
                    return Tab(
                      text: e.name,
                    );
                  },
                ).toList(),
              ),
              16.spaceVertical,
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    return ArticleCard(
                      articleData: _cubit.currentArticles[index],
                    );
                  },
                  separatorBuilder: (context, index) => 16.spaceVertical,
                  itemCount: _cubit.currentArticles.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
