// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:food_app/pretention/controller/cart_cubit/cart_cubit.dart';
import 'package:food_app/pretention/view/Invoice/invoice_order.dart';

import '../../../core/styles/app_styles.dart';

class InvoiceView extends StatelessWidget {
  final CartCubit cartCubit;
  const InvoiceView({
    Key? key,
    required this.cartCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartCubit.cart.length,
              itemBuilder: (context, index) {
                final cartItem = cartCubit.cart[index];
                return ListTile(
                  title: Text(
                    cartItem.nameFood,
                    style: Styles.style20,
                  ),
                  trailing: Text(
                    '${cartCubit.totalPrice(cartCubit.cart)} جنية',
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
          InvoiceOrder(cartCubit: cartCubit),
        ],
      ),
    );
  }
}
