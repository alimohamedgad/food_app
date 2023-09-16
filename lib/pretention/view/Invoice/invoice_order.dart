import 'package:flutter/material.dart';
import 'package:food_app/pretention/controller/cart_cubit/cart_cubit.dart';

import '../../../core/styles/app_styles.dart';

class InvoiceOrder extends StatelessWidget {
  const InvoiceOrder({
    super.key,
    required this.cartCubit,
  });

  final CartCubit cartCubit;
  @override
  Widget build(BuildContext context) {
    const deliveryPrice = 5;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
      ),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'المجموع :',
                style: Styles.style18,
              ),
              Text(
                '${cartCubit.totalPrice(cartCubit.cart)} جنية',
                style: Styles.style18,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'سعر التوصيل :',
                style: Styles.style18,
              ),
              Text(
                ' $deliveryPrice جنية',
                style: Styles.style18,
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'السعر الكلى :',
                style: Styles.style18,
              ),
              Text(
                '${cartCubit.totalPrice(cartCubit.cart) + deliveryPrice} جنية',
                style: Styles.style18,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
