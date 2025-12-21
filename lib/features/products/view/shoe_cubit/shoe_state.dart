import '../../domain/product_entity/shoe.dart';

class ShoeState{
  List<Shoe> shoes;
  bool isLoading;
  bool isReachedMax;
  int page;
  String? errMsg;

  ShoeState({
    required this.shoes,
    required this.isReachedMax,
    required this.page,
    required this.isLoading,
     this.errMsg
  });

  factory ShoeState.initial()
  {
    return ShoeState(
        shoes: [],
        isReachedMax: false,
        page: 1,
        isLoading: false);
  }

}