// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food_app/core/app_image/image.dart';

import '../../../core/app_color/colors.dart';
import '../../../data/model/food_model.dart';
import 'widgets/food_details_component/appbar_food_details.dart';
import 'widgets/food_details_component/food_details_item.dart';

class FoodDetails extends StatelessWidget {
  final FoodModel foodItem;
  const FoodDetails({
    Key? key,
    required this.foodItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              color: Colors.deepOrange.withOpacity(0.1),
            ),
            Image.asset(
              AppImage.splashImage,
              color: Colors.black,
            ),
            Column(
              children: [
                const AppBarFoodDetails(),
                Expanded(
                    child: FoodDetailsItem(
                  foodItem: foodItem,
                )),
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
