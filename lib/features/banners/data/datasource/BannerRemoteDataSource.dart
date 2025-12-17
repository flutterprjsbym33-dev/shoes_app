import 'dart:io';

import 'package:shoe/core/utils/CustomExpn.dart';
import 'package:shoe/features/banners/data/model/BannerModel.dart';
import 'package:shoe/features/banners/domain/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BannerRemoteDataSource{
  SupabaseClient supabaseClient;
  BannerRemoteDataSource({required this.supabaseClient});
  
  List<BannerModel> getBanners()
  {
    try{
      final bannerJson = supabaseClient.from('banners').select() as List;
      final imageUrls =  bannerJson.map((e)=>BannerModel.fromJson(e)).toList();
      return imageUrls;
      
    }on SocketException {
      throw NoInternetException();
      
    } catch (e)
    {
      throw ServerErrorException();
    }
  }
  
}