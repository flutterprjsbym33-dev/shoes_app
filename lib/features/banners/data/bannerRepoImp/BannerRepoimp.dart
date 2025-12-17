import 'package:dart_either/src/dart_either.dart';
import 'package:flutter/cupertino.dart';
import 'package:shoe/core/utils/CustomExpn.dart';
import 'package:shoe/features/authentication/business/DataSource/RemoteDataSource.dart';
import 'package:shoe/features/banners/data/datasource/BannerRemoteDataSource.dart';
import 'package:shoe/features/banners/data/datasource/BannersLocalDataSource.dart';
import 'package:shoe/features/banners/domain/bannerRepo/BannerRepo.dart';
import 'package:shoe/features/banners/domain/entity/BannerEntity.dart';
import 'package:shoe/features/banners/domain/failure.dart';

class BannerRepoImplementaion extends BannerRepo {

  BannerRemoteDataSource bannerRemoteDataSource;
  BannersLocalDataSource bannersLocalDataSource;

  BannerRepoImplementaion({
    required this.bannerRemoteDataSource,
    required this.bannersLocalDataSource
});



  @override
  Future<Either<Failure, List<BannerEntity>>> getBanners()async
  {
    try{
      final urls = await bannerRemoteDataSource.getBanners();
      bannersLocalDataSource.catchBanner(urls);
       return Right(urls);
    } on NoInternetException
    {
      try{
        final catched =  await bannersLocalDataSource.getCatchedBanner();
        return Right(catched);

      } on CacheFailure{
        debugPrint("Image Fetched Errorrrrrrrrrrr.");
        return Left(CacheFailure("No catched Banners"));
      }
    } on ServerFailure
    {
      try{
        final catched =  await bannersLocalDataSource.getCatchedBanner();
        return Right(catched);

      } on CacheFailure{
        debugPrint("Image Fetched Errorrrrrrrrrrr.");
        return Left(CacheFailure("No catched Banners"));
      }

    }

  }

}