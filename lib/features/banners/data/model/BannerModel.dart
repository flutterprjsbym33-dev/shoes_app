import 'package:shoe/features/banners/domain/entity/BannerEntity.dart';

class BannerModel extends BannerEntity{
  BannerModel({required super.imageUrl});
  
   factory BannerModel.fromJson(Map<String,dynamic> map)
   {
     return BannerModel(imageUrl: map['banner_img'] ?? "");
   }

   Map<String,dynamic> toJson()
   {
     return {
       'banner_img':super.imageUrl
     };

   }
  
  
}