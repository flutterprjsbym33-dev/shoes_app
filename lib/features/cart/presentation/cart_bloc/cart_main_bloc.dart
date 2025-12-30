import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoe/features/cart/presentation/cart_bloc/cart_events.dart';
import 'package:shoe/features/cart/presentation/cart_bloc/cart_state.dart';

import '../../domain/cart_use_cases/add_to_cart.dart';

class CartBloc extends Bloc<CartMainEvents,CartMainState>
{
  AddToCart addToCartUseCase;
  CartBloc({required this.addToCartUseCase}):super(CartInitialState());




  Future<void> addToCart(AddToCartEvent event, Emitter<CartMainState> emit)async
  {
    emit(AddToCartLoading());
   final result = await addToCartUseCase.call(event.cart);
   result.fold(ifLeft: (failure)=>emit(AddToCartError(errMsg: failure.message)),
       ifRight: (success)=>emit(AddToCartSuccessfull(cart: success)));


  }
}