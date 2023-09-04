// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/app_color/colors.dart';
import '../../../data/model/food.dart';
import 'widgets/food_details/appbar_food_details.dart';
import 'widgets/food_details/food_details_item.dart';

class FoodDetails extends StatelessWidget {
  final FoodModel foodItem;
  final int index;
  const FoodDetails({
    Key? key,
    required this.foodItem,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppBarFoodDetails(),
                Expanded(
                    child: FoodDetailsItem(foodItem: foodItem, index: index)),
              ],
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 50),
              child: Image.asset(
                foodItem.image,
                height: 150,
              ),
            ).animate().fade().scale(
                  duration: 650.ms,
                  curve: Curves.fastOutSlowIn,
                ),
          ],
        ),
      ),
    );
  }
}
