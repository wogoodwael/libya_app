import 'package:bloc/bloc.dart';
import 'package:libya_bakery/data/models/categories_model.dart';
import 'package:libya_bakery/data/services/categories_services.dart';
import 'package:meta/meta.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  List<CategoriesModel>? categoriesList;
  CategoryServices categoryServices;
  CategoriesCubit(this.categoryServices) : super(CategoriesInitial());
  getCategoriesCubit() async {
    emit(Categoriesloading());
    try {
      categoriesList = await categoryServices.getCategoriesNames();
      emit(CategoriesSuccess(categoriesList: categoriesList!));
    } catch (e) {
      emit(Categoriesfail());
    }
  }
}
