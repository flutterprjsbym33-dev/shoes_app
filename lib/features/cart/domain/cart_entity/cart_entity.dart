import '../../../products/domain/product_entity/shoe.dart';

class Cart{
 Shoe shoe;
 int quantity;
  Cart({
    required this.shoe,
    required this.quantity,
   });

  Cart copyWith({int? quantity})
  {
    return Cart(shoe: this.shoe, quantity: quantity ?? this.quantity);
  }
}