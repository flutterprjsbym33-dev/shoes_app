import 'package:dart_either/dart_either.dart';
import 'package:shoe/features/banners/domain/failure.dart';

import '../product_entity/shoe.dart';

abstract class ShoeRepository {
 Future< Either<Failure,List<Shoe>>> getShoes({
    String? brand,
    required int page,
    required int limit,
  });
}
