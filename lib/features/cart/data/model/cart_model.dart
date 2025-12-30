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

  @HiveField(8)
  String id;

  @HiveField(9)
  double price;

  @HiveField(10)
  double oldPrice;


  CartModel({
    required this.shoeTitle,
    required this.id,
    required this.price,
    required this.oldPrice,
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
        time: cartItem.time,
      id: cartItem.shoe.id,
      price: cartItem.shoe.newPrice,
      oldPrice: cartItem.shoe.oldPrice,

    );
  }

  Cart toEntity(CartModel cartModel)
  {
    return Cart(
        shoe: Shoe(id:cartModel.id ,
            title: cartModel.shoeTitle,
            description: cartModel.shoediscrip,
            brand: cartModel.brand,
            sizes: [],
            rating: 0.0,
            oldPrice: 0.0,
            newPrice: cartModel.price,
            images: [shoeImg]),
        quantity: cartModel.quantity,
        size: cartModel.size,
        time: cartModel.time);
  }


  CartModel copyWith(int qty)
  {
    return CartModel(
        shoeTitle: this.shoeTitle,
        id: this.id,
        price: this.price,
        oldPrice: this.oldPrice,
        shoeImg: this.shoeImg,
        shoediscrip: this.shoediscrip,
        size: this.size,
        quantity: qty ?? this.quantity,
        brand: this.brand,
        time: this.time);
  }







}