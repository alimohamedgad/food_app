import 'package:flutter/material.dart';
import 'package:food_app/data/model/food_model.dart';

class HomeController extends ChangeNotifier {
  addToFavorite(FoodModel food) {
    food.isFavorite = !food.isFavorite;
    notifyListeners();
  }
}
