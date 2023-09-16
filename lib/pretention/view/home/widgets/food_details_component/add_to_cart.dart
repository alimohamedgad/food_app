// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/app_color/colors.dart';

class AddToCartButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  const AddToCartButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(45),
            backgroundColor: AppColor.primaryColor),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ).animate().fade().scaleXY(
          duration: 600.ms,
          curve: Curves.fastOutSlowIn,
        );
  }
}
