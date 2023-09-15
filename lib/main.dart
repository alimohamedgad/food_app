import 'package:flutter/material.dart';
import 'package:food_app/pretention/controller/cart_controller.dart';
import 'package:food_app/pretention/controller/home_controller.dart';
import 'package:food_app/pretention/controller/payment_controller.dart';
import 'package:provider/provider.dart';
import 'pretention/view/payment/payment_view.dart';
import 'pretention/view/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PaymentController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(useMaterial3: true, fontFamily: 'Cairo'),
        home: const SplashView(),
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
      ),
    );
  }
}
