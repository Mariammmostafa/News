part of 'category_news_cubit.dart';

@immutable
abstract class CategoryNewsState {}

final class CategoryNewsInitial extends CategoryNewsState {}

final class CategoryNewsLoadded extends CategoryNewsState {}

final class CategoryNewsFailuer extends CategoryNewsState {
  final String message;

  CategoryNewsFailuer({required this.message});
}
