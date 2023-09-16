// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/btm.dart';
import 'package:food_app/core/styles/app_styles.dart';

import 'package:food_app/pretention/controller/cart_cubit/cart_cubit.dart';

import '../../controller/payment_cubit/payment_cubit.dart';
import 'visa_card_view.dart';
import 'widgets/text_form_field.dart';

class CheckHowUserWillPay extends StatefulWidget {
  final CartCubit cartCubit;
  const CheckHowUserWillPay({
    Key? key,
    required this.cartCubit,
  }) : super(key: key);

  @override
  State<CheckHowUserWillPay> createState() => _CheckHowUserWillPayState();
}

class _CheckHowUserWillPayState extends State<CheckHowUserWillPay> {
  final phoneController = TextEditingController();
  final priceController = TextEditingController();
  final nameController = TextEditingController();
  final streetController = TextEditingController();
  String payWithoutVisa = 'الدفع عند الاستلام';
  String payByVisa = 'الدفع اونلاين';
  String? pay;

  @override
  void dispose() {
    phoneController.dispose();
    priceController.dispose();
    phoneController.dispose();
    streetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit()..getAuthPayment(),
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            PaymentTextFormField(
              controller: nameController,
              hintText: 'الاسم',
            ),
            PaymentTextFormField(
              controller: phoneController,
              hintText: 'الهاتف',
            ),
            PaymentTextFormField(
              controller: streetController,
              hintText: 'المكان',
            ),
            PaymentTextFormField(
              controller: priceController,
              hintText:
                  widget.cartCubit.totalPrice(widget.cartCubit.cart).toString(),
            ),
            RadioListTile(
              value: payWithoutVisa,
              groupValue: pay,
              title: Text(payWithoutVisa),
              onChanged: (v) {
                setState(() {
                  pay = v!;
                });
              },
            ),
            RadioListTile(
              title: Text(payByVisa),
              value: payByVisa,
              groupValue: pay,
              onChanged: (v) {
                setState(() {
                  pay = v!;
                });
              },
            ),
            BlocConsumer<PaymentCubit, PaymentState>(
              listener: (context, state) {
                if (state is GetPaymentRequestSuccess) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VisaCardView(
                        finalToken: context.read<PaymentCubit>().finalToken,
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                final payCubit = context.read<PaymentCubit>();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange),
                    onPressed: pay == null
                        ? () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('يرجي اختيار وسيلة الدفع'),
                              ),
                            );
                            print('eeeeeee');
                          }
                        : () async {
                            await paymentOrder(payCubit);
                          },
                    child: Text(
                      'استكمال الطلب',
                      style: Styles.style18.copyWith(color: Colors.white),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> paymentOrder(PaymentCubit payCubit) async {
    if (pay == payByVisa) {
      await payCubit.getOrderId(
        price: '${widget.cartCubit.totalPrice(widget.cartCubit.cart) + 5}',
        email: nameController.text,
        name: nameController.text,
        phone: phoneController.text,
      );
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => PaymentView(
      //         // finalToken: context.read<PaymentCubit>().finalToken,
      //         ),
      //   ),
      // );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NavBarScreen(),
        ),
      );
    }
  }
}
