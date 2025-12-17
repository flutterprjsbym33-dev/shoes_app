import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:shoe/core/utils/CustomExpn.dart';
import 'package:shoe/features/banners/data/model/BannerModel.dart';
import 'package:shoe/features/banners/domain/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BannerRemoteDataSource{
  SupabaseClient supabaseClient;
  BannerRemoteDataSource({required this.supabaseClient});
  
  Future<List<BannerModel>> getBanners() async
  {
    try{
      final bannerJson =  await supabaseClient.from('banners').select() as List;
      print('BannerJson ->>>>>>>>$bannerJson');
      final imageUrls =  bannerJson.map((e)=>BannerModel.fromJson(e)).toList();
      print('ImageUrls $imageUrls');
      return imageUrls;
      
    }on SocketException {
      debugPrint("Image Fetched Errorrrrrrrrrrr.");
      throw NoInternetException();
      
    } catch (e)
    {
      debugPrint("Image Fetched Errorrrrrrrrrrr.");
      throw ServerErrorException();
    }
  }
  
}