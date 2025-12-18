import 'package:flutter_bloc/flutter_bloc.dart';

class IsCatSelected extends Cubit<int>
{
  IsCatSelected():super(0);

  void onSelected(int index)
  {
    emit(index);
  }

}