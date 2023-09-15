// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:food_app/btm.dart';

import '../../../../core/Shared/increment_decrement.dart';
import '../../../../core/styles/app_styles.dart';
import '../../../../data/model/food_model.dart';
import '../../../controller/cart_controller.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.foodItem,
    required this.cartController,
  }) : super(key: key);

  final FoodModel foodItem;
  final CartController cartController;

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
                  ' ${foodItem.price * foodItem.quantity} جنية',
                  style: Styles.style18,
                ),
                const SizedBox(height: 8),
                Text(
                  ' ${foodItem.size} ',
                  style: Styles.style18,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    IncrementAndDecrement(
                      icon: Icons.remove,
                      onTap: () {
                        cartController.decrement(foodItem);
                      },
                    ),
                    const SizedBox(width: 10),
                    Text(
                      foodItem.quantity.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 10),
                    IncrementAndDecrement(
                      icon: Icons.add,
                      onTap: () {
                        cartController.increment(foodItem);
                      },
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        cartController.removeFromCart(foodItem);
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.grey.withOpacity(0.9),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
