import 'package:flutter/material.dart';
import 'package:food_app/core/styles/app_styles.dart';
import 'package:food_app/pretention/controller/cart_controller.dart';
import 'package:provider/provider.dart';
import 'cart_list_view.dart';
import '../../Invoice/invoice_order.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, value, child) {
        final cartController = Provider.of<CartController>(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CartListView(cartController: cartController),
            if (cartController.totalPrice(cartController.cart) == 0)
              const SizedBox()
            else
              InvoiceOrder(cartController: cartController),
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => InvoiceView(
                  //       cartController: cartController,
                  //     ),
                  //   ),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                ),
                child: Text(
                  'تابع لأتمام عملية الشراء',
                  style: Styles.style18.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
