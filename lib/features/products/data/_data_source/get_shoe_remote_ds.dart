import 'package:shoe/features/products/data/model/shoe_model.dart';

abstract class GetShoeRemoteDataSource{
  Future<List<ShoeModel>> getShoeFromSupabase();
}
