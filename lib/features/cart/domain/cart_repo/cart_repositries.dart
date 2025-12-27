import '../../../products/domain/product_entity/shoe.dart';
import '../cart_entity/cart_entity.dart';

abstract class CartRepository {
//add to cart
  Future<Cart> addToCart(Shoe shoe);

  // remove from cart
Future<void> removeFromCart(String id);

//update quantity











}