part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesSuccess extends CategoriesState {
 final List<CategoriesModel> categoriesList;

  CategoriesSuccess({required this.categoriesList});
}

final class Categoriesloading extends CategoriesState {}

final class Categoriesfail extends CategoriesState {}
