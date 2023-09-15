// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:food_app/pretention/controller/cart_controller.dart';
import 'package:food_app/pretention/view/Invoice/invoice_order.dart';

import '../../../core/styles/app_styles.dart';

class InvoiceView extends StatelessWidget {
  final CartController cartController;
  const InvoiceView({
    Key? key,
    required this.cartController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartController.cart.length,
              itemBuilder: (context, index) {
                final cartItem = cartController.cart[index];
                return ListTile(
                  title: Text(
                    cartItem.nameFood,
                    style: Styles.style20,
                  ),
                  trailing: Text(
                    '${cartController.totalPrice(cartController.cart)} جنية',
                    style: Styles.style16,
                  ),
                  subtitle: Text(
                    " الكمية / ${cartItem.quantity.toString()} ",
                    style: Styles.style18,
                  ),
                );
              },
            ),
          ),
          InvoiceOrder(cartController: cartController),
        ],
      ),
    );
  }
}
