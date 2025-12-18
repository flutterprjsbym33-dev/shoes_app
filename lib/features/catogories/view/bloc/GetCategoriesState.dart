import 'package:shoe/features/catogories/data/cat_model/cat_items_model.dart';
import 'package:shoe/features/catogories/domain/cato_entity/categories_entity.dart';

abstract class FetchCategoriesMainState{}
 class FetchCategoriesInitialState extends FetchCategoriesMainState{}
class FetchCategoriesLoadingState extends FetchCategoriesMainState{}
class FetchCategoriesSuccessState extends FetchCategoriesMainState{
  List<CategoriesEntity> catoList;
  FetchCategoriesSuccessState({required this.catoList});
}
class FetchCategoriesErrorState extends FetchCategoriesMainState{
  String errMsg;
  FetchCategoriesErrorState({required this.errMsg});
}