import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoe/features/products/domain/product_use_cases/get_product.dart';
import 'package:shoe/features/products/view/shoe_cubit/shoe_state.dart';

class FetchShoeCubit extends Cubit<ShoeState> {
  int limit = 4;
  GetShoes getShoes;
  FetchShoeCubit({
    required this.getShoes
}):super(ShoeState.initial());

  Future<void> getShoesForHome()async
  {
    if(state.isLoading && state.isReachedMax) return;


    emit(ShoeState(shoes: state.shoes,
        isReachedMax: state.isReachedMax,
        page: state.page,
        isLoading: true));

    final newShoes = await getShoes(
      brand: '',
      page: state.page,
      limit: limit,
    );

    debugPrint('>$newShoes');


    newShoes.fold(ifLeft: (failure)=>emit(
        ShoeState(shoes: [],
        isReachedMax: false,
        page:state.page,
        isLoading: false,
        errMsg: failure.message)),
        ifRight: (success)=>emit(
          ShoeState(
              shoes: [...state.shoes,...success],
              isReachedMax: success.length<limit,
              page: state.page+1,
              isLoading: false)
        ));

  }

  Future<void> getShoesFormBrand(String brand)async
  {
    if(state.isLoading && state.isReachedMax) return;


    emit(ShoeState.initial());
    emit(ShoeState(shoes: state.shoes,
        isReachedMax: state.isReachedMax,
        page: state.page,
        isLoading: true));


    final newShoes = await getShoes(
      brand: brand,
      page: state.page,
      limit: limit,
    );

    newShoes.fold(ifLeft: (failure)=>emit(
        ShoeState(shoes: [],
            isReachedMax: false,
            page:state.page,
            isLoading: false,
            errMsg: failure.message)),
        ifRight: (success)=>emit(
            ShoeState(
                shoes: success,
                isReachedMax: success.length<limit,
                page: state.page+1,
                isLoading: false)
        ));

  }



}
