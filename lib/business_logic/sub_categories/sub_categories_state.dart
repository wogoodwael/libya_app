part of 'sub_categories_cubit.dart';

@immutable
sealed class SubCategoriesState {}

final class SubCategoriesInitial extends SubCategoriesState {}

final class SubCategoriesLoading extends SubCategoriesState {}

final class SubCategoriesSuccess extends SubCategoriesState {
final  List<SubCategoriesModel> subCategoriesList;

  SubCategoriesSuccess({required this.subCategoriesList});
}

final class SubCategoriesFail extends SubCategoriesState {}
