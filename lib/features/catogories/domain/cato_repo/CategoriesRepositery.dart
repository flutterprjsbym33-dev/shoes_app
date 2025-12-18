 import 'package:dart_either/dart_either.dart';
import 'package:shoe/features/banners/domain/failure.dart';
import 'package:shoe/features/catogories/domain/cato_entity/categories_entity.dart';

abstract class CategoriesRepository {

  Future<Either<Failure,List<CategoriesEntity>>> getCategories();

}