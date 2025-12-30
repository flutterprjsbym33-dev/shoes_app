import 'package:dart_either/src/dart_either.dart';
import 'package:shoe/features/banners/domain/failure.dart';
import 'package:shoe/features/cart/domain/cart_entity/cart_entity.dart';
import 'package:shoe/features/cart/domain/cart_repo/cart_repositries.dart';

class GetCartItems{
  CartRepository cartRepository;
  GetCartItems({required this.cartRepository});

  Future<Future<Either<Failure, List<Cart>>>> call()async{
   return cartRepository.getAllCartItems();
  }
}
