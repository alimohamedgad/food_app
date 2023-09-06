// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:food_app/data/model/food_model.dart';

import '../../../../../btm.dart';
import '../../../../../core/app_color/colors.dart';

class AddToCart extends StatefulWidget {
  final FoodModel foodItem;
  final int selectedIndex;
  const AddToCart({
    Key? key,
    required this.foodItem,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            foodCart.add(
              FoodModel(
                size: widget.foodItem.priceAndSize![widget.selectedIndex].size,
                price:
                    widget.foodItem.priceAndSize![widget.selectedIndex].price,
                id: '1',
                userID: '1',
                nameFood: widget.foodItem.nameFood,
                image: widget.foodItem.image,
                category: widget.foodItem.category,
                priceAndSize: widget.foodItem.priceAndSize,
                isFavorite: true,
                quantity: widget.foodItem.quantity,
              ),
            );
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NavBarScreen(),
                ));
            //   setState(() {
            //     foodData.add(
            //       FoodModel(
            //         id: '22',
            //         userID: '22',
            //         nameFood: 'بيتزا فراخ',
            //         image: AppImage.pizza,
            //         category: 'بيتزا',
            //         priceAndSize: [
            //           FoodDetailsModel(price: 15, size: 'صغير'),
            //           FoodDetailsModel(size: 'وسط'),
            //           FoodDetailsModel(price: 35, size: 'كبير'),
            //         ],
            //         isFavorite: true,
            //       ),
            //     );

            //   });
          });
        },
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
    ).animate().fade().scaleXY(
          duration: 600.ms,
          curve: Curves.fastOutSlowIn,
        );
  }
}
