import 'dart:io';

import 'package:shoe/core/utils/CustomExpn.dart';
import 'package:shoe/features/cart/data/model/cart_model.dart';

import '../../domain/cart_entity/cart_entity.dart';
import 'package:hive/hive.dart';


abstract class CartLocalDataSourceRepo{
  Future<Cart> addToCart(Cart cart);

}

class CartLocalDataSource extends CartLocalDataSourceRepo{
  Box<CartModel> box;
  CartLocalDataSource({required this.box});



  @override
  Future<Cart> addToCart(Cart cart)async {

    try{
       await box.put(cart.shoe.id, CartModel.fromEntity(cart));
     final cartItem =await box.get(cart.shoe.id);
     return cartItem!.toEntity(cartItem);
    } on SocketException{
      throw NoInternetException();
    } catch (e)
    {
      throw ServerErrorException();
    }

  }


}