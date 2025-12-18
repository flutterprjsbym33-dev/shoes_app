import 'package:dart_either/dart_either.dart';
import 'package:shoe/features/banners/domain/failure.dart';
import 'package:shoe/features/catogories/domain/cato_entity/categories_entity.dart';
import 'package:shoe/features/catogories/domain/cato_repo/CategoriesRepositery.dart';

class GetCategoriesUseCae{

  CategoriesRepository categoriesRepository;
  GetCategoriesUseCae({required this.categoriesRepository});

  Future<Either<Failure,List<CategoriesEntity>>> call(){
     return categoriesRepository.getCategories();
  }

}