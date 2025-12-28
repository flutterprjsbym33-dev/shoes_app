import 'package:shoe/features/cart/domain/cart_repo/cart_repositries.dart';

class QuantityManager{
  CartRepository cartRepository;
  QuantityManager({required this.cartRepository});

  Future<void> call(String shoeId,int quantity)async
  {
    cartRepository.quantityManger(shoeId,quantity);
  }

}