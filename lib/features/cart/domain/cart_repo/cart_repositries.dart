import 'package:dart_either/dart_either.dart';
import 'package:shoe/features/banners/domain/failure.dart';

import '../../../products/domain/product_entity/shoe.dart';
import '../cart_entity/cart_entity.dart';

abstract class CartRepository {
//add to cart
  Future<Either<Failure,Cart>> addToCart(Cart cart);

  // remove from cart
Future<void> removeFromCart(String shoeId);

//update quantity

Future<void> quantityManger(String shoeId,int quantity);

Future<List<Cart>> getAllCartItems();











}