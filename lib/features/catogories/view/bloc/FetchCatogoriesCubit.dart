import 'package:dart_either/dart_either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoe/features/catogories/domain/UseCases/GetCateogories.dart';
import 'package:shoe/features/catogories/view/bloc/GetCategoriesState.dart';

class FetchCatogoriesCubit extends Cubit<FetchCategoriesMainState>
{
  GetCategoriesUseCae getCategoriesUseCae;
  FetchCatogoriesCubit({required this.getCategoriesUseCae}):super(FetchCategoriesInitialState());

   Future<void> getAllCato()async
   {
     emit(FetchCategoriesLoadingState());
     final result =  await getCategoriesUseCae.call();

     result.fold(ifLeft: (failure)=>emit(FetchCategoriesErrorState(errMsg: failure.message)),
         ifRight: (success)=>emit(FetchCategoriesSuccessState(catoList: success)));

   }

}