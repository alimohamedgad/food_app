import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/styles/app_styles.dart';
import 'package:food_app/pretention/controller/cart_cubit/cart_cubit.dart';
import '../../payment/check_how_user_pay.dart';
import 'cart_list_view.dart';
import '../../Invoice/invoice_order.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, child) {
        final cartController = BlocProvider.of<CartCubit>(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CartListView(cartCubit: cartController),
            if (cartController.totalPrice(cartController.cart) == 0)
              const SizedBox()
            else
              InvoiceOrder(cartCubit: cartController),
            if (cartController.totalPrice(cartController.cart) == 0)
              const SizedBox()
            else
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CheckHowUserWillPay(cartCubit: cartController),
                      ),
                    );
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
