import 'package:shoe/features/cart/domain/cart_repo/cart_repositries.dart';
import 'package:dart_either/dart_either.dart';
import '../../../banners/domain/failure.dart';
import '../cart_entity/cart_entity.dart';

class RemoveFromCart{
  CartRepository cartRepository;
  RemoveFromCart({required this.cartRepository});

  Future<Either<Failure,Cart>> call(String shoeId)async
  {
   return await cartRepository.removeFromCart(shoeId);

  }
}