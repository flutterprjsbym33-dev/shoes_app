import 'package:shoe/features/catogories/domain/cato_entity/categories_entity.dart';

class CategoryModel extends CategoriesEntity {
  CategoryModel({required super.id, required super.cat_image, required super.cat_title});

  factory CategoryModel.fromJson(Map<String,dynamic> map)
  {
    return CategoryModel(
        id: map['id'].toString() ?? '',
        cat_image: map['cat_img'] ?? '',
        cat_title: map['cat_title'] ?? '');
  }



}