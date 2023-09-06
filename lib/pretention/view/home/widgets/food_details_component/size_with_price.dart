// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import '../../../../../data/model/food_model.dart';

class SizeWithPriceContainer extends StatefulWidget {
  final FoodModel foodItem;
  int selectedIndex;
  SizeWithPriceContainer({
    Key? key,
    required this.foodItem,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<SizeWithPriceContainer> createState() => _SizeWithPriceContainerState();
}

class _SizeWithPriceContainerState extends State<SizeWithPriceContainer> {
  // int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...List.generate(
          widget.foodItem.priceAndSize!.length,
          (index) => InkWell(
            onTap: () {
              setState(() {
                widget.selectedIndex = index;
              });
              print(widget.foodItem.priceAndSize![widget.selectedIndex].price);
              print(widget.foodItem.priceAndSize![widget.selectedIndex].size);
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
                  color: widget.selectedIndex == index
                      ? Colors.green
                      : Colors.grey.withOpacity(0.5),
                  width: widget.selectedIndex == index ? 2 : 1,
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
                      color: widget.selectedIndex == index
                          ? Colors.green
                          : Colors.grey,
                    ),
                    child: CircleAvatar(
                        backgroundColor: widget.selectedIndex == index
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
    );
  }
}
