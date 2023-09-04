import 'package:flutter/material.dart';
import 'widget/cart_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const CartBody(),
    );
  }
}
