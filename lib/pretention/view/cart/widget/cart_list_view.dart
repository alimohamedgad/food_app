// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:food_app/core/app_image/image.dart';
import 'package:food_app/pretention/controller/cart_controller.dart';

import '../../../../core/Shared/empty_cart.dart';
import '../../../../core/styles/app_styles.dart';
import '../../../../data/model/food_model.dart';
import 'cart_item.dart';

class CartListView extends StatelessWidget {
  final CartController cartController;
  const CartListView({
    Key? key,
    required this.cartController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: cartController.cart.isEmpty
          ? const EmptyCart()
          : ListView.builder(
              itemCount: cartController.cart.length,
              itemBuilder: (context, index) {
                final foodItem = cartController.cart[index];

                return CartItem(
                  foodItem: foodItem,
                  cartController: cartController,
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
