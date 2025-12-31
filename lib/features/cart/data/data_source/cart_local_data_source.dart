import 'dart:io';

import 'package:shoe/core/utils/CustomExpn.dart';
import 'package:shoe/features/cart/data/model/cart_model.dart';

import '../../domain/cart_entity/cart_entity.dart';
import 'package:hive/hive.dart';


abstract class CartLocalDataSourceRepo{
  Future<Cart> addToCart(Cart cart);

  Future<bool> removeFromCart(String shoeId);

  Future<Cart> increaseQty(String shoeId,int qty);

  Future<List<Cart>> getAllCartItems();

}

class CartLocalDataSource extends CartLocalDataSourceRepo{
  Box<CartModel> box;
  CartLocalDataSource({required this.box});



  @override
  Future<Cart> addToCart(Cart cart)async {

    try{
      final existing =  await box.get(cart.shoe.id);
      if(existing!=null)
        {
        final qtyIncrease = await  existing.copyWith(existing.quantity+1);
        await box.put(cart.shoe.id, qtyIncrease);
        return qtyIncrease.toEntity(qtyIncrease);
        }

       await box.put(cart.shoe.id, CartModel.fromEntity(cart));
     final cartItem =await box.get(cart.shoe.id);
     return cartItem!.toEntity(cartItem);
    } on SocketException{
      throw NoInternetException();
    } catch (e)
    {
      print(e.toString());
      throw ServerErrorException();
    }

  }

  @override
  Future<List<Cart>> getAllCartItems()async {
   try{
     final cartItems =  await box.values.map((e)=>e.toEntity(e)).toList();
     return cartItems;
   }on SocketException{
     throw NoInternetException();
   } catch (e){
     throw ServerErrorException();
    }
  }

  @override
  Future<Cart> increaseQty(String shoeId,int qty) async{
    try{
      final qnty= await box.get(shoeId);
    final cartModel =  await qnty!.copyWith(qty);
    await box.put(shoeId,cartModel);
     final cart = await box.get(shoeId);
     return cart!.toEntity(cart);

    }on SocketException{
      throw NoInternetException();
    } catch(e)
    {
      throw ServerErrorException();
    }
  }

  @override
  Future<bool> removeFromCart(String shoeId)async {
    try{
      await box.delete(shoeId);
      return true;
    }on SocketException{
      throw NoInternetException();
    } catch(e)
    {
      throw ServerErrorException();
    }

  }


}