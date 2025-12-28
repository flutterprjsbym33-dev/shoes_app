import 'package:shoe/features/cart/domain/cart_entity/cart_entity.dart';
import 'package:shoe/features/cart/domain/cart_repo/cart_repositries.dart';

class AddToCart {
  CartRepository cartRepository;

  AddToCart({required this.cartRepository});

  Future<void> call(Cart item) {
    return cartRepository.addToCart(item);
  }

}