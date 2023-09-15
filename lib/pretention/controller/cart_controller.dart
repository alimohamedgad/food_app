import 'package:flutter/material.dart';
import 'package:food_app/data/model/food_model.dart';

class CartController extends ChangeNotifier {
  List<FoodModel> cart = [];

  void increment(FoodModel food) {
    food.quantity = food.quantity! + 1;
    notifyListeners();
  }

  void addToCart(FoodModel cartModel) {
    cart.add(cartModel);
    notifyListeners();
  }

  void removeFromCart(FoodModel cartModel) {
    cart.remove(cartModel);
    notifyListeners();
  }

  void decrement(FoodModel food) {
    if (food.quantity == 1) {
      return;
    } else {
      food.quantity = food.quantity! - 1;
    }
    notifyListeners();
  }

  totalPrice(List<FoodModel> cartList) {
    num total = 0;
    for (var item in cart) {
      total += item.quantity! * item.price;
    }
    return total;
  }
}
