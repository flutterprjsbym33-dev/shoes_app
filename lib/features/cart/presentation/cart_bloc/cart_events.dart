import '../../domain/cart_entity/cart_entity.dart';

abstract class CartMainEvents{}
class AddToCartEvent extends CartMainEvents{
  Cart cart;
  AddToCartEvent({required this.cart});
}

class RemoveFromCardE extends CartMainEvents{
  String shoeId;
  RemoveFromCardE({required this.shoeId});
}

class GetAllCardItemsE extends CartMainEvents{}

class IncreaseQtyE extends CartMainEvents{
  String shoeId;
  int qty;
  IncreaseQtyE({required this.shoeId,required this.qty});
}