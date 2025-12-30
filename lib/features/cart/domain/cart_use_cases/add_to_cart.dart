import 'package:dart_either/dart_either.dart';
import 'package:shoe/features/banners/domain/failure.dart';
import 'package:shoe/features/cart/domain/cart_entity/cart_entity.dart';
import 'package:shoe/features/cart/domain/cart_repo/cart_repositries.dart';

class AddToCart {
  CartRepository cartRepository;

  AddToCart({required this.cartRepository});

  Future<Either<Failure,Cart>> call(Cart item) {
    return cartRepository.addToCart(item);
  }

}