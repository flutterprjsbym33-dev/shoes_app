import '../../../products/domain/product_entity/shoe.dart';

class Cart{
 Shoe shoe;
 int quantity;
 int size;
 DateTime time;
  Cart({
    required this.shoe,
    required this.quantity,
    required this.size,
    required this.time
   });


}