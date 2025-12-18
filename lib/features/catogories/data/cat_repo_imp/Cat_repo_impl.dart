import 'package:dart_either/src/dart_either.dart';
import 'package:shoe/core/utils/CustomExpn.dart';
import 'package:shoe/features/banners/domain/failure.dart';
import 'package:shoe/features/catogories/data/cat_data_source/CatRepoLocalDataSource.dart';
import 'package:shoe/features/catogories/domain/cato_entity/categories_entity.dart';
import 'package:shoe/features/catogories/domain/cato_repo/CategoriesRepositery.dart';

class CategoriesRepoImplemantation extends CategoriesRepository{

  CatRepoLocalDataSource catRepoLocalDataSource;
  CategoriesRepoImplemantation({required this.catRepoLocalDataSource});

  @override
  Future<Either<Failure, List<CategoriesEntity>>> getCategories() async{
    try{
      final data = await catRepoLocalDataSource.getCatoFromRemoteDataSource();
      return Right(data);

    } on NoInternetException {
      return Left(NetworkFailure("No Internet Connection"));

    } on ServerErrorException {
      return Left(ServerFailure("Server Error"));
    }

  }

}