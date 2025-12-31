import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoe/features/cart/domain/cart_use_cases/remove_from_cart.dart';
import 'package:shoe/features/cart/presentation/cart_bloc/cart_events.dart';
import 'package:shoe/features/cart/presentation/cart_bloc/cart_state.dart';

import '../../domain/cart_use_cases/add_to_cart.dart';
import '../../domain/cart_use_cases/get_all_cart_items.dart';
import '../../domain/cart_use_cases/quantity_manager.dart';

class CartBloc extends Bloc<CartMainEvents,CartMainState>
{
  AddToCart addToCartUseCase;
  GetCartItems getAllCardItems;
  IncreaseQuantity increaseQty;
  RemoveFromCart removeFromCart;
  CartBloc({required this.addToCartUseCase,
    required this.removeFromCart,
    required this.increaseQty,
  required this.getAllCardItems}):super(CartInitialState()){
   on<AddToCartEvent>(addToCart);
   on<GetAllCardItemsE>(getAllCartItems);
   on<RemoveFromCardE>(removeFromCartt);
   on<IncreaseQtyE>(increaseQtty);
  }




  Future<void> addToCart(AddToCartEvent event, Emitter<CartMainState> emit)async
  {
    emit(AddToCartLoading());
   final result = await addToCartUseCase.call(event.cart);
   result.fold(ifLeft: (failure)=>emit(AddToCartError(errMsg: failure.message)),
       ifRight: (success)=>emit(AddToCartSuccessfull(cart: success)));


  }

  Future<void> getAllCartItems(  GetAllCardItemsE event , Emitter<CartMainState> emit)async
  {
    emit(GetAllCartItemsLoading());
    final result = await getAllCardItems.call();
    result.fold(ifLeft: (failure)=>emit(GetAllCartItemsError(errMsg: failure.message)),
        ifRight: (success)=>emit(GetAllCartItemsSuccessfull(cartItems: success)));

  }

  Future<void> removeFromCartt(RemoveFromCardE event , Emitter<CartMainState> emit)async
  {
    emit(DeleateCartItemLoading());
    final result = await removeFromCart.call(event.shoeId);
    result.fold(ifLeft: (failure)=>emit(DeleateCartItemError(errMsg: failure.message)),
        ifRight: (success)=>emit(DeleateCartItemSuccessFull()));

  }

  Future<void> increaseQtty(IncreaseQtyE event , Emitter<CartMainState> emit)async
  {
    emit(IncreaseQtyLoading());
    final result = await increaseQty.call(event.shoeId,event.qty);
    result.fold(ifLeft: (failure)=>emit(IncreaseQtyError(errMsg: failure.message)),
        ifRight: (success)=>emit(IncreaseQtySuccessFull()));

  }


}