import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/styles/app_styles.dart';
import '../../../../data/model/food_model.dart';
import 'cart_item.dart';
import 'cart_quantity.dart';

class CartListView extends StatelessWidget {
  const CartListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: foodCart.length,
        itemBuilder: (context, index) {
          final foodItem = foodCart[index];

          return CartItem(
            foodItem: foodItem,
          ).animate(delay: (100 * index).ms).fade().slideX(
                duration: 300.ms,
                begin: -1,
                curve: Curves.easeInSine,
              );
        },
      ),
    );
  }
}
