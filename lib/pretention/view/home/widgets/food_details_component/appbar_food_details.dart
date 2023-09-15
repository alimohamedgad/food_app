import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pretention/view/cart/cart_view.dart';

class AppBarFoodDetails extends StatelessWidget {
  const AppBarFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(CupertinoIcons.back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const CartView(),
              //     ));
            },
            icon: Icon(Icons.favorite_border),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
