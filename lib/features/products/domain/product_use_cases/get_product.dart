import 'package:dart_either/src/dart_either.dart';

import 'package:shoe/features/banners/domain/failure.dart';

import '../product_entity/shoe.dart';
import '../product_repo/shoe_repo.dart';

class GetShoes {
  final ShoeRepository repository;

  GetShoes(this.repository);

  Future<Either<Failure, List<Shoe>>> call({
    String? brand,
    required int page,
    required int limit,
  }) {
    return repository.getShoes(
      brand: brand,
      page: page,
      limit: limit,
    );
  }
}
