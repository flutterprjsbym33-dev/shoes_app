import '../../domain/cart_entity/cart_entity.dart';

abstract class CartLocalDataSourceRepo{
  Future<void> addToCart();

}

class CartLocalDataSource extends CartLocalDataSourceRepo{
  @override
  Future<void> addToCart() {
    // TODO: implement addToCart
    throw UnimplementedError();
  }


}