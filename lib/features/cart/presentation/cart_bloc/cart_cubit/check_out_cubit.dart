import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoe/features/cart/presentation/cart_bloc/cart_cubit/check_out_state.dart';

import '../../../domain/cart_entity/cart_entity.dart';

class CheckOutCubit extends Cubit<CheckOutState>
{
  CheckOutCubit():super(CheckOutState.initial());


  //select individual or more items
  void itemSelected(
  {
    required int index,
    required List<Cart> items
  })
  {
    final selected = Set<int>.from(state.slectedIndex);

    if(selected.contains(index))
      {
        selected.remove(index);
      }

      else{
      selected.add(index);
    }

      double total = 0.0;
     for(final i in selected)
       {
         total = total+items[i].shoe.newPrice*items[i].quantity;
       }

     emit(state.copyWith(
       selectedIndex: selected,
       totalPrice: total,
       selectedAll: selected.length == items.length

     ));


  }


  void selectedAll(List<Cart> items)
  {
    if(state.selectedAll)
      {
        emit(state.copyWith(
          selectedAll: false,
          selectedIndex: {},
          totalPrice: 0.0
        ));
      }
    else{
      final list = Set<int>.from(List.generate(items.length, (i)=>i));
      double total = 0.0;
      for(final item in items)
        {
          total = total+item.quantity*item.shoe.newPrice;

        }
      emit(state.copyWith(
        selectedIndex: list,
        selectedAll: true,
        totalPrice: total
      ));


    }
  }
}