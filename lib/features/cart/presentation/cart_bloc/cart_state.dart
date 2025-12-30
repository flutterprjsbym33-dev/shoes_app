import '../../domain/cart_entity/cart_entity.dart';

abstract class CartMainState{}

//Fetch All cart Items State
class CartInitialState extends CartMainState{}
class GetAllCartItemsSuccessfull extends CartMainState{
  List<Cart> cartItems;
  GetAllCartItemsSuccessfull({required this.cartItems});

}
class GetAllCartItemsLoading extends CartMainState{}
class GetAllCartItemsError extends CartMainState{
  String errMsg;
  GetAllCartItemsError({required this.errMsg});

}
//Add to cart Items State

class AddToCartSuccessfull extends CartMainState{
  Cart cart;
  AddToCartSuccessfull({required this.cart});
}

class AddToCartLoading extends CartMainState{}
class AddToCartError extends CartMainState{
  String errMsg;
  AddToCartError({required this.errMsg});
}

// increase qty state

class IncreaseQtySuccessFull extends CartMainState{

}
class IncreaseQtyLoading extends CartMainState{}
class IncreaseQtyError extends CartMainState{
  String errMsg;
  IncreaseQtyError({required this.errMsg});
}

// Delete cart item state

class DeleateCartItemSuccessFull extends CartMainState{}
class DeleateCartItemLoading extends CartMainState{}
class DeleateCartItemError extends CartMainState{
  String errMsg;
  DeleateCartItemError({required this.errMsg});
}