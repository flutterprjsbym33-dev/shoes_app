import '../../domain/cart_entity/cart_entity.dart';

abstract class CartMainEvents{}
class AddToCart extends CartMainEvents{
  Cart cart;
  AddToCart({required this.cart});
}

class RemoveFromCard extends CartMainEvents{
  String shoeId;
  RemoveFromCard({required this.shoeId});
}

class GetAllCardItems extends CartMainEvents{}

class IncreaseQty extends CartMainEvents{
  String shoeId;
  int qty;
  IncreaseQty({required this.shoeId,required this.qty});
}