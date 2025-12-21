import '../../domain/product_entity/shoe.dart';

class ShoeState{
  List<Shoe> shoes;
  bool isLoading;
  bool isReachedMax;
  int page;

  ShoeState({
    required this.shoes,
    required this.isReachedMax,
    required this.page,
    required this.isLoading,
  });

  factory ShoeState.initia()
  {
    return ShoeState(
        shoes: [],
        isReachedMax: false,
        page: 1,
        isLoading: false);
  }

}