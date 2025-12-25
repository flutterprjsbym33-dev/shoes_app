import 'package:flutter_bloc/flutter_bloc.dart';

class SizeManager extends Cubit<int>
{
  SizeManager():super(0);

  void addSize(int index){
    emit(index);


  }
}