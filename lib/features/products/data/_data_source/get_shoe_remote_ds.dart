import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:shoe/core/utils/CustomExpn.dart';
import 'package:shoe/features/products/data/model/shoe_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class GetShoeRemoteDataSource{
  Future<List<ShoeModel>> getShoeFromSupabase({
    String? brand,
    required int page,
    required int limit
  });
}

class FetchSoesRemoteDataSource extends GetShoeRemoteDataSource{
  SupabaseClient supabaseClient;
  FetchSoesRemoteDataSource({required this.supabaseClient});

  @override
  Future<List<ShoeModel>> getShoeFromSupabase({String? brand, required int page, required int limit})async
  {
    try{
      final from = (page-1)*limit;
      final to = from+limit-1;
      var querry =   supabaseClient.from('shoes').select();
      debugPrint("data ====>$querry");

      if(brand!=null && brand.isNotEmpty)
      {
        querry = querry.eq('brand', brand);
      }

      final data = await querry.range(from, to) as List;
      debugPrint("Raw data length: ${data.length}");
      debugPrint(data.toString());



      return data.map((e)=>ShoeModel.fromJson(e)).toList();
    } on SocketException {
      throw NoInternetException();
    } catch (e)
    {
      throw ServerErrorException();
    }

  }



}