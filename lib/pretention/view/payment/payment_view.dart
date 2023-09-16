import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/pretention/controller/payment_cubit/payment_cubit.dart';
import 'package:provider/provider.dart';
import 'visa_card_view.dart';
import 'widgets/text_form_field.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final priceController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void initState() {
    context.read<PaymentCubit>().getAuthPayment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Integration'),
      ),
      body: BlocConsumer<PaymentCubit, PaymentState>(
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
        builder: (context, child) {
          final payment = context.read<PaymentCubit>();
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'email',
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    hintText: 'Phone',
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    hintText: 'Price',
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                    onPressed: () async {
                      await payment.getOrderId(
                        price: priceController.text,
                        email: emailController.text,
                        name: nameController.text,
                        phone: phoneController.text,
                      );
                      // if (context.mounted) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) =>
                      //           VisaCardView(finalToken: payment.finalToken),
                      //     ),
                      //   );
                      // }
                    },
                    child: const Text('Payment'))
              ],
            ),
          );
        },
      ),
    );
  }
}
