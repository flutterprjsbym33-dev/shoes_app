import 'package:hive_flutter/adapters.dart';
import 'package:shoe/features/cart/domain/cart_entity/cart_entity.dart';
import 'package:shoe/features/products/domain/product_entity/shoe.dart';

@HiveType(typeId: 1)
class CartModel extends HiveObject {
  @HiveField(1)
  String shoeTitle;

  @HiveField(2)
  String shoeImg;

  @HiveField(3)
  String shoediscrip;

  @HiveField(4)
  int quantity;

  @HiveField(5)
  DateTime time;

  @HiveField(6)
  int size;

  @HiveField(7)
  String brand;


  CartModel({
    required this.shoeTitle,
    required this.shoeImg,
    required this.shoediscrip,
    required this.size,
    required this.quantity,
    required this.brand,
    required this.time,
  });


  factory CartModel.fromEntity(Cart cartItem)
  {
    return CartModel(shoeTitle: cartItem.shoe.title
        , shoeImg: cartItem.shoe.images[1],
        shoediscrip: cartItem.shoe.description,
        size: cartItem.size,
        quantity: cartItem.quantity,
        brand: cartItem.shoe.brand,
        time: cartItem.time);
  }







}