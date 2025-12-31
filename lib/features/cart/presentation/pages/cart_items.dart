import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoe/core/utils/snackbar.dart';
import 'package:shoe/features/cart/presentation/cart_bloc/cart_events.dart';
import 'package:shoe/features/cart/presentation/cart_bloc/cart_main_bloc.dart';
import 'package:shoe/features/cart/presentation/cart_bloc/cart_state.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CartBloc>().add(GetAllCardItemsE());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CartBloc,CartMainState>(
        listener: (context,state){
          if(state is GetAllCartItemsError)
            {
              ShowSnacBar(context: context, discrip: state.errMsg, type: SnackBarType.Error);
            }
        },
          builder: (context,state){
            if(state is GetAllCartItemsSuccessfull)
              {
                return ListView.builder(
                 
                  itemCount: state.cartItems.length,
                    itemBuilder: (context,index)
                  {
                    return Row(
                      children: [
                        SizedBox(
                          height: 100,
                          child: Image.network(state.cartItems[index].shoe.images[0]),
                        ),



                      ],
                    );
                  },
                );

              }
            else{
               return Center(child: Text("No Cart Items"),);

            }
          }
      ),
    );
  }
}
