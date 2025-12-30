import 'package:shoe/core/utils/CustomExpn.dart';
import 'package:shoe/features/cart/data/data_source/cart_local_data_source.dart';
import 'package:shoe/features/cart/domain/cart_entity/cart_entity.dart';
import 'package:shoe/features/cart/domain/cart_repo/cart_repositries.dart';

import '../../../banners/domain/failure.dart';
import 'package:dart_either/dart_either.dart';

class CartRepoImplementation extends CartRepository {
  CartLocalDataSource cartLocalDataSource;

  CartRepoImplementation({required this.cartLocalDataSource});

  @override
  Future<Either<Failure,Cart>> addToCart(Cart cart)async {
    try{
      final item =  await cartLocalDataSource.addToCart(cart);
      return Right(item);


    }on NoInternetException{
      return Left(NetworkFailure("Network Failure"));
    }on ServerErrorException{
      return Left(ServerFailure("Server Failure"));
    }
  }

  @override
  Future<Either<Failure, List<Cart>>> getAllCartItems() {
    // TODO: implement getAllCartItems
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Cart>> quantityManger(String shoeId, int quantity) {
    // TODO: implement quantityManger
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Cart>> removeFromCart(String shoeId) {
    // TODO: implement removeFromCart
    throw UnimplementedError();
  }

}