import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoe/core/utils/snackbar.dart';
import 'package:shoe/features/cart/presentation/cart_bloc/cart_cubit/check_out_cubit.dart';
import 'package:shoe/features/cart/presentation/cart_bloc/cart_events.dart';
import 'package:shoe/features/cart/presentation/cart_bloc/cart_main_bloc.dart';
import 'package:shoe/features/cart/presentation/cart_bloc/cart_state.dart';
import 'package:shoe/features/cart/presentation/widgets/cart_items.dart';
import 'package:shoe/features/cart/presentation/widgets/show_toal.dart';

import '../../domain/cart_entity/cart_entity.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

 late List<Cart> items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CartBloc>().add(GetAllCardItemsE());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: GoogleFonts.ibmPlexSans(
            textStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700
            )
          ),
        ),
      ),
      body: Stack(
        children: [
           BlocConsumer<CartBloc,CartMainState>(
              listener: (context,state){
                if(state is GetAllCartItemsError)
                  {
                    ShowSnacBar(context: context, discrip: state.errMsg, type: SnackBarType.Error);
                  }
                if(state is GetAllCartItemsSuccessfull)
                {
                  items = state.cartItems;


                }

              },
                builder: (context,state){
                  if(state is GetAllCartItemsSuccessfull)
                    {

                      return Padding(
                        padding: const EdgeInsets.only(left: 4.0,right: 8),
                        child: ListOfCartItems(items: state.cartItems),
                      );

                    }
                  else{
                     return Center(child: Text("No Cart Items"),);

                  }
                }
            ),

          context.watch<CheckOutCubit>().state.selectedAll ||
              context.read<CheckOutCubit>().state.slectedIndex.length>0
        ?
          Positioned(
            bottom:50,
            left: 10,right: 10,
            child: ShowTotal(items: items ?? [],)
          ) : SizedBox()
        ],
      ),
    );
  }
}
