import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:shoe/core/utils/CustomExpn.dart';
import 'package:shoe/features/catogories/data/cat_model/cat_items_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CatRepoLocalDataSource{
  final SupabaseClient supabaseClient;
  CatRepoLocalDataSource({required this.supabaseClient});


 Future<List<CategoryModel>> getCatoFromRemoteDataSource()async
 {
   try{
     final rawCato =  await supabaseClient.from('shoe_cat').select();
     final catoList = rawCato.map((e)=>CategoryModel.fromJson(e)).toList();
     return catoList;

   }on SocketException {
     debugPrint("CatError ->>>>>>> E");
     throw NoInternetException();
   } catch (e)
   {
     debugPrint("CatError ->>>>>>> ${e.toString()}");
     throw ServerErrorException();
   }
   
 }




}