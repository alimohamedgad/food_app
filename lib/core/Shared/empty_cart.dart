import 'package:flutter/material.dart';

import '../app_image/image.dart';
import '../styles/app_styles.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppImage.emptyCart),
        Text(
          'لا يوجد طلبات',
          style: Styles.style20,
        ),
      ],
    );
  }
}
