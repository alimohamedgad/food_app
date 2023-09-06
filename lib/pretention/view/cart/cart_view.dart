import 'package:flutter/material.dart';
import 'package:food_app/core/styles/app_styles.dart';
import 'widget/cart_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'طلباتي',
          style: Styles.style20.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const CartBody(),
    );
  }
}
