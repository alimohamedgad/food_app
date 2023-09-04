import 'package:flutter/material.dart';

class FoodIngredients extends StatelessWidget {
  const FoodIngredients({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        'صوص طماطم  +  موتزاريلا +  سوسيس +  فلفل +  زيتون',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
