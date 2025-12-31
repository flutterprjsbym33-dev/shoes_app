import '../../domain/cart_entity/cart_entity.dart';

abstract class CartMainEvents{}
class AddToCartEvent extends CartMainEvents{
  Cart cart;
  AddToCartEvent({required this.cart});
}

class RemoveFromCardS extends CartMainEvents{
  String shoeId;
  RemoveFromCardS({required this.shoeId});
}

class GetAllCardItems extends CartMainEvents{}

class IncreaseQty extends CartMainEvents{
  String shoeId;
  int qty;
  IncreaseQty({required this.shoeId,required this.qty});
}