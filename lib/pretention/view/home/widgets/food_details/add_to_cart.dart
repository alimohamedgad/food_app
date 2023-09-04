import 'package:flutter/material.dart';

import '../../../../../core/app_color/colors.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(45),
            backgroundColor: AppColor.primaryColor),
        child: const Text(
          'Add To Cart',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
