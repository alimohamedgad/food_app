// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:food_app/btm.dart';
import 'package:food_app/pretention/view/cart/cart_view.dart';

import '../../../../core/Shared/increment_decrement.dart';
import '../../../../core/styles/app_styles.dart';
import '../../../../data/model/food_model.dart';
import 'cart_quantity.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    Key? key,
    required this.foodItem,
  }) : super(key: key);

  final FoodModel foodItem;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14),
      child: Row(
        children: [
          Image.asset(
            widget.foodItem.image,
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
                  widget.foodItem.nameFood,
                  style: Styles.style20,
                ),
                const SizedBox(height: 8),
                Text(
                  'جنية ${widget.foodItem.price} ',
                  style: Styles.style18,
                ),
                Text(
                  ' ${widget.foodItem.size} ',
                  style: Styles.style18,
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Row(
                    children: [
                      IncrementAndDecrement(
                        icon: Icons.remove,
                        onTap: () {
                          if (widget.foodItem.quantity == 1) {
                            return;
                          } else {
                            setState(() {
                              widget.foodItem.quantity =
                                  widget.foodItem.quantity! - 1;
                            });
                          }
                        },
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.foodItem.quantity.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(width: 10),
                      IncrementAndDecrement(
                          icon: Icons.add,
                          onTap: () {
                            setState(() {
                              widget.foodItem.quantity =
                                  widget.foodItem.quantity! + 1;
                            });
                          }),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            foodCart.remove(widget.foodItem);
                          });
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NavBarScreen(),
                            ),
                            (route) => false,
                          );
                          print(foodCart.length);
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.grey.withOpacity(0.9),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
