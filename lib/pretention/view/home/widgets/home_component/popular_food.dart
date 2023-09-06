// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:food_app/core/Shared/test.dart';
import 'package:food_app/core/app_image/image.dart';
import 'package:food_app/data/model/food_details.dart';

import '../../../../../data/model/food_model.dart';
import '../../food_details.dart';

class PopularFood extends StatefulWidget {
  final FoodModel foodItem;
  const PopularFood({
    Key? key,
    required this.foodItem,
  }) : super(key: key);

  @override
  State<PopularFood> createState() => _PopularFoodState();
}

class _PopularFoodState extends State<PopularFood> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return FoodDetails(
                foodItem: widget.foodItem,
              );
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
            Text(widget.foodItem.nameFood),
            Image.asset(
              widget.foodItem.image,
              height: 100,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.foodItem.priceAndSize!.map((e) => e.price).first.toString()} جنية ',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.favorite_outline_sharp))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
