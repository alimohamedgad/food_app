// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food_app/pretention/controller/cart_controller.dart';
import 'package:provider/provider.dart';
import '../../../../../data/model/food_model.dart';
import 'add_to_cart.dart';
import 'food_ingredients.dart';
import 'total_price.dart';

class FoodDetailsItem extends StatefulWidget {
  final FoodModel foodItem;
  const FoodDetailsItem({
    Key? key,
    required this.foodItem,
  }) : super(key: key);

  @override
  State<FoodDetailsItem> createState() => _FoodDetailsItemState();
}

class _FoodDetailsItemState extends State<FoodDetailsItem> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.only(top: 90),
      decoration: const BoxDecoration(
        color: Colors.white,
        // border: Border.all(color: Colors.deepOrange.withOpacity(0.5), width: 2),
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
          priceWithSize(),
          const SizedBox(height: 10),
          const FoodIngredients(),
          const Spacer(),
          TotalPrice(
            foodItem: widget.foodItem,
            selectedIndex: selectedIndex,
          ),
          Consumer(
            builder: (context, value, child) {
              final cartController = Provider.of<CartController>(context);
              return AddToCart(
                text: 'Add To Cart',
                onTap: () {
                  addToCart(cartController);
                  Navigator.pop(context);
                },
              );
            },
          )
        ],
      ),
    );
  }

  void addToCart(CartController cartController) {
    setState(() {
      cartController.cart.add(
        FoodModel(
          size: widget.foodItem.priceAndSize![selectedIndex].size,
          price: widget.foodItem.priceAndSize![selectedIndex].price,
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
    });
  }

  Widget priceWithSize() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...List.generate(
          widget.foodItem.priceAndSize!.length,
          (index) => widget.foodItem.priceAndSize?[index].price == 0
              ? const SizedBox()
              : InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    // print(widget.foodItem.priceAndSize![selectedIndex].price);
                    // print(widget.foodItem.priceAndSize![selectedIndex].size);
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
    );
  }
}
