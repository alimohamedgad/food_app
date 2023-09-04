// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../data/model/food.dart';
import '../../food_details.dart';

class PopularFood extends StatelessWidget {
  final FoodModel foodItem;
  final int index;
  const PopularFood({
    Key? key,
    required this.foodItem,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return FoodDetails(foodItem: foodItem, index: index);
            },
          ),
        );
      },
      child: Container(
        width: 200,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
            )
          ],
        ),
        child: Column(
          children: [
            Text(foodItem.nameFood),
            Image.asset(
              foodItem.image,
              height: 100,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'جنية ${foodItem.priceAndSize!.map((e) => e.price).first.toString()} ',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.favorite_outline_sharp)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
