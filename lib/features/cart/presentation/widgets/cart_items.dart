
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/cart_entity/cart_entity.dart';
import '../cart_bloc/cart_cubit/check_out_cubit.dart';

class ListOfCartItems extends StatelessWidget {
  List<Cart> items;
   ListOfCartItems({required this.items});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return  ListView.builder(
      itemCount: items.length,
      itemBuilder: (context,index)
      {
        final selctedIndex = context.watch<CheckOutCubit>().state.slectedIndex.contains(index);
        return Row(
          children: [
            //CheckBoxIcon
            SizedBox(
              height:height*0.05,
              child: IconButton(
                  onPressed: (){

                    context.read<CheckOutCubit>().itemSelected(
                        index: index,
                        items: items);

                  },
                  icon:
                  Icon( selctedIndex  ?
                  Icons.check_box : Icons.check_box_outline_blank_rounded)),
            ),
            //Cart Image
            SizedBox(
              height: height*0.1,
              child: Image.network(items[index].shoe.images[0]),
            ),
            Column(
              children: [
                Text("${items[index].time}"),
                Text('${items[index].quantity}')
              ],
            )



          ],
        );
      },
    );
  }
}
