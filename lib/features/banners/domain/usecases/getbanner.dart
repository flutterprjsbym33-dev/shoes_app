import 'package:dart_either/dart_either.dart';
import 'package:shoe/features/banners/domain/bannerRepo/BannerRepo.dart';
import 'package:shoe/features/banners/domain/failure.dart';

import '../entity/BannerEntity.dart';


class GetBanner{
  BannerRepo bannerRepo;
  GetBanner({required this.bannerRepo});


  Future<Either<Failure, List<BannerEntity>>> call() {
    return bannerRepo.getBanners();
  }


}