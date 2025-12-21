import 'package:dart_either/src/dart_either.dart';
import 'package:shoe/core/utils/CustomExpn.dart';
import 'package:shoe/features/banners/domain/failure.dart';
import 'package:shoe/features/products/data/_data_source/get_shoe_remote_ds.dart';
import 'package:shoe/features/products/domain/product_entity/shoe.dart';
import 'package:shoe/features/products/domain/product_repo/shoe_repo.dart';

class ShoeRepoImplementation extends ShoeRepository{
  GetShoeRemoteDataSource getShoeRemoteDataSource;
  ShoeRepoImplementation({required this.getShoeRemoteDataSource});

  @override
  Future<Either<Failure, List<Shoe>>> getShoes({String? brand, required int page, required int limit})async {
    try{

      final shoes = await getShoeRemoteDataSource.getShoeFromSupabase(brand: brand, page: page, limit: limit);
      return Right(shoes);

    }on NoInternetException{
      return Left(NetworkFailure('Internet Unaviliable'));
    } on ServerErrorException {
      return Left(ServerFailure("Server Not Responding"));
    }
  }

}