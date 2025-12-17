import 'package:hive/hive.dart';
import 'package:shoe/core/utils/CustomExpn.dart';
import 'package:shoe/features/banners/data/model/BannerModel.dart';
import 'package:shoe/features/banners/domain/failure.dart';

class BannersLocalDataSource
{

  final Box box;
  BannersLocalDataSource({required this.box});

  Future<void> catchBanner(List<BannerModel> banners)async
  {
    final bannersJson = banners.map((i)=>i.toJson()).toList();
    box.put('banners', bannersJson);
  }

  Future<List<BannerModel>> getCatchedBanner()async
  {

      final json = await box.get('banners') ;
      if(json == null)
        {
          throw CatchedExpection();
        }
      final jsonList = json as List;
      return jsonList.map((i)=>BannerModel.fromJson(i)).toList();



  }

}