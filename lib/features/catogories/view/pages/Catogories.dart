
import 'package:flutter/material.dart';
import 'package:shoe/features/catogories/view/widgets/CatogoriesWidget.dart';

class Catogories extends StatelessWidget {
  const Catogories({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: MediaQuery.of(context).size.height*0.1,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: CatogoriesWidget(),
        ),
      ),
    );
  }
}
