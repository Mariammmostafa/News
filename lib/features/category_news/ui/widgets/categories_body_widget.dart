import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newss_app/core/theme/app_colors.dart';
import 'package:newss_app/features/category_news/ui/cubit/category_news_cubit.dart';

class CategoriesBodyWidget extends StatefulWidget {
  const CategoriesBodyWidget({super.key});

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
    return DefaultTabController(
      length: _cubit.sources.length,
      child: TabBar(
        labelColor: AppColors.black,
        indicatorColor: AppColors.black,
        dividerColor: Colors.transparent,
        unselectedLabelColor: Colors.grey,
        padding: EdgeInsets.zero,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        tabs: _cubit.sources.map(
          (e) {
            return Tab(text: e.name);
          },
        ).toList(),
      ),
    );
  }
}
