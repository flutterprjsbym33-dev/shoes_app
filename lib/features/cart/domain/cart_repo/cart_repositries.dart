import 'package:dart_either/dart_either.dart';
import 'package:shoe/features/banners/domain/failure.dart';

import '../../../products/domain/product_entity/shoe.dart';
import '../cart_entity/cart_entity.dart';

abstract class CartRepository {
//add to cart
  Future<Either<Failure,Cart>> addToCart(Cart cart);

  // remove from cart
Future<Either<Failure,Cart>> removeFromCart(String shoeId);

//update quantity

Future<Either<Failure,Cart>> quantityManger(String shoeId,int quantity);

Future<Either<Failure,List<Cart>>> getAllCartItems();











}