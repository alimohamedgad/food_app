// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food_app/data/model/food_details.dart';

import '../../../../../core/Shared/increment_decrement.dart';
import '../../../../../core/app_color/colors.dart';
import '../../../../../data/model/food.dart';
import 'food_ingredients.dart';

class FoodDetailsItem extends StatefulWidget {
  final FoodModel foodItem;
  final int index;
  const FoodDetailsItem({
    Key? key,
    required this.foodItem,
    required this.index,
  }) : super(key: key);

  @override
  State<FoodDetailsItem> createState() => _FoodDetailsItemState();
}

class _FoodDetailsItemState extends State<FoodDetailsItem> {
  int selectedIndex = 0;
  List<FoodDetailsModel> food = [
    FoodDetailsModel(price: 0, size: 'صغير'),
    FoodDetailsModel(price: 0, size: 'وسط'),
    FoodDetailsModel(price: 0, size: 'كبير'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.only(top: 90),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Text(
            widget.foodItem.nameFood,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ).animate().fade(duration: 500.ms).scale(delay: 500.ms),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...List.generate(
                widget.foodItem.priceAndSize?.length ?? food.length,
                (index) => InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });

                    print(widget.foodItem.priceAndSize![selectedIndex].price);
                    print(widget.foodItem.priceAndSize![selectedIndex].size);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 700),
                    width: 90,
                    height: 130,
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: selectedIndex == index
                            ? Colors.green
                            : Colors.grey.withOpacity(0.5),
                        width: selectedIndex == index ? 2 : 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 700),
                          height: 25,
                          width: 25,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selectedIndex == index
                                ? Colors.green
                                : Colors.grey,
                          ),
                          child: CircleAvatar(
                              backgroundColor: selectedIndex == index
                                  ? Colors.green
                                  : Colors.white,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                height: 10,
                                width: 10,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              )),
                        ),
                        Text(
                          widget.foodItem.priceAndSize![index].size,
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          "${widget.foodItem.priceAndSize![index].price} ",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          const FoodIngredients().animate().fade().slideY(
                duration: 400.ms,
                begin: -1,
                curve: Curves.easeInSine,
              ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Row(
              children: [
                Text(
                  'Total : ${widget.foodItem.priceAndSize![selectedIndex].price}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IncrementAndDecrement(
                  icon: Icons.remove,
                  onTap: () {},
                ),
                const SizedBox(width: 10),
                const Text(
                  '1',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 10),
                IncrementAndDecrement(icon: Icons.add, onTap: () {}),
              ],
            ),
          ).animate().fade().scaleY(
                duration: 800.ms,
                curve: Curves.fastOutSlowIn,
              ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  foodCart.add(FoodModel(
                    bigSize: widget.foodItem.priceAndSize![selectedIndex].size,
                    mainPrice:
                        widget.foodItem.priceAndSize![selectedIndex].price,
                    id: '1',
                    userID: '1',
                    nameFood: widget.foodItem.nameFood,
                    image: widget.foodItem.image,
                    category: widget.foodItem.image,
                    priceAndSize: widget.foodItem.priceAndSize,
                    isFavorite: true,
                  ));
                });
                print(foodCart.length);
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
              ),
        ],
      ),
    );
  }
}
