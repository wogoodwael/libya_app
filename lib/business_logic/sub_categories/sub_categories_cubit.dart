import 'package:bloc/bloc.dart';
import 'package:libya_bakery/data/models/sub_categ_model.dart';
import 'package:libya_bakery/data/services/sub_categories.dart';
import 'package:meta/meta.dart';

part 'sub_categories_state.dart';

class SubCategoriesCubit extends Cubit<SubCategoriesState> {
  SubCategorieServices subCategorieServices;
  List<SubCategoriesModel>? subCategoriesList;
  SubCategoriesCubit(this.subCategorieServices) : super(SubCategoriesInitial());
  getSubCategoriesCupit() async {
    emit(SubCategoriesLoading());
    try {
      subCategoriesList =
          await subCategorieServices.getSubCategories();
      emit(SubCategoriesSuccess(subCategoriesList: subCategoriesList!));
    } catch (e) {
      emit(SubCategoriesFail());
    }
  }
}
