import 'package:shoe/features/cart/domain/cart_repo/cart_repositries.dart';

class RemoveFromCart{
  CartRepository cartRepository;
  RemoveFromCart({required this.cartRepository});

  Future<void> call(String shoeId)async
  {
    cartRepository.removeFromCart(shoeId);

  }
}