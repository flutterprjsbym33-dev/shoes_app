
import 'package:dart_either/dart_either.dart';
import 'package:shoe/features/banners/domain/entity/BannerEntity.dart';
import 'package:shoe/features/banners/domain/failure.dart';

abstract class BannerRepo{
  Future<Either<Failure,List<BannerEntity>>> getBanners();
}