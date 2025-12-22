import '../../domain/product_entity/shoe.dart';

class ShoeModel extends Shoe {
  ShoeModel({
    required super.id,
    required super.title,
    required super.description,
    required super.brand,
    required super.sizes,
    required super.rating,
    required super.oldPrice,
    required super.newPrice,
    required super.images,
  });

  factory ShoeModel.fromJson(Map<String, dynamic> json) {
    return ShoeModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      brand: json['brand'] ?? '',
      sizes: List<int>.from(json['sizes'] ?? []) ,
      rating: (json['rating'] as num).toDouble(),
      oldPrice: (json['old_price'] as num).toDouble(),
      newPrice: (json['new_price'] as num).toDouble(),
      images: List<String>.from(json['images'] ?? []),
    );
  }
}
