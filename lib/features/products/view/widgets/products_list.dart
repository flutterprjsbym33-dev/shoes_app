import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/material.dart';
import 'package:shoe/features/products/view/widgets/shoe_card.dart';
import '';
import '../../domain/product_entity/shoe.dart';

class ProductsList extends StatelessWidget {
  final List<Shoe> shoes;
  final int length;

  const ProductsList({
    super.key,
    required this.shoes,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 1000),
            child: SlideAnimation(
              verticalOffset: 80.0,
              child: FadeInAnimation(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ShoeCard(shoe: shoes[index]),
                ),
              ),
            ),
          );
        },
        childCount: length,
      ),
    );
  }
}
