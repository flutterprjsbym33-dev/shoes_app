import 'package:dart_either/dart_either.dart';
import 'package:shoe/features/cart/domain/cart_repo/cart_repositries.dart';

import '../../../banners/domain/failure.dart';
import '../cart_entity/cart_entity.dart';

class QuantityManager{
  CartRepository cartRepository;
  QuantityManager({required this.cartRepository});

  Future<Either<Failure,Cart>> call(String shoeId,int quantity)async
  {
    return await cartRepository.quantityManger(shoeId,quantity);
  }

}