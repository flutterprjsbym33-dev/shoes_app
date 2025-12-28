import '../../../products/domain/product_entity/shoe.dart';
import '../cart_entity/cart_entity.dart';

abstract class CartRepository {
//add to cart
  Future<Cart> addToCart(Cart cart);

  // remove from cart
Future<void> removeFromCart(String shoeId);

//update quantity

Future<void> quantityManger(String shoeId);

Future<List<Cart>> getAllCartItems();











}