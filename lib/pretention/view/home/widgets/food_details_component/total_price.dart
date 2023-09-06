// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:food_app/data/model/food_model.dart';

import '../../../../../core/Shared/increment_decrement.dart';

class TotalPrice extends StatefulWidget {
  final int selectedIndex;
  final FoodModel foodItem;
  const TotalPrice({
    Key? key,
    required this.selectedIndex,
    required this.foodItem,
  }) : super(key: key);

  @override
  State<TotalPrice> createState() => _TotalPriceState();
}

class _TotalPriceState extends State<TotalPrice> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Row(
        children: [
          Text(
            'المجموع : ${widget.foodItem.priceAndSize![widget.selectedIndex].price * widget.foodItem.quantity!}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          IncrementAndDecrement(
            icon: Icons.add,
            onTap: () {
              setState(() {
                widget.foodItem.quantity = widget.foodItem.quantity! + 1;
              });
            },
          ),
          const SizedBox(width: 10),
          Text(
            '${widget.foodItem.quantity!}',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(width: 10),
          IncrementAndDecrement(
            icon: Icons.remove,
            onTap: () {
              if (widget.foodItem.quantity == 1) {
                return;
              } else {
                setState(() {
                  widget.foodItem.quantity = widget.foodItem.quantity! - 1;
                });
              }
            },
          ),
        ],
      ),
    ).animate().fade().scaleY(
          duration: 800.ms,
          curve: Curves.fastOutSlowIn,
        );
  }
}
