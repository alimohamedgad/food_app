// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:food_app/pretention/controller/cart_cubit/cart_cubit.dart';

import '../../../../core/Shared/empty_cart.dart';
import 'cart_item.dart';

class CartListView extends StatelessWidget {
  final CartCubit cartCubit;
  const CartListView({
    Key? key,
    required this.cartCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: cartCubit.cart.isEmpty
          ? const EmptyCart()
          : ListView.builder(
              itemCount: cartCubit.cart.length,
              itemBuilder: (context, index) {
                final foodItem = cartCubit.cart[index];

                return CartItem(
                  foodItem: foodItem,
                  cartCubit: cartCubit,
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
