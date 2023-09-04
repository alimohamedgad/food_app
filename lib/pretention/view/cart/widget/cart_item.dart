// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/styles/app_styles.dart';
import '../../../../data/model/food.dart';
import 'cart_quantity.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.foodItem,
    required this.index,
  }) : super(key: key);

  final FoodModel foodItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14),
      child: Row(
        children: [
          Image.asset(
            foodItem.image,
            width: 100,
            height: 100,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodItem.nameFood,
                  style: Styles.style20,
                ),
                const SizedBox(height: 8),
                Text(
                  'جنية ${foodItem.mainPrice} ',
                  style: Styles.style18,
                ),
                Text(
                  ' ${foodItem.bigSize} ',
                  style: Styles.style18,
                ),
                const SizedBox(height: 8),
                const CartQuantity(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
