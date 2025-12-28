import 'package:shoe/features/cart/domain/cart_entity/cart_entity.dart';
import 'package:shoe/features/cart/domain/cart_repo/cart_repositries.dart';

class GetCartItems{
  CartRepository cartRepository;
  GetCartItems({required this.cartRepository});

  Future<List<Cart>> call()async{
   return cartRepository.getAllCartItems();
  }
}
