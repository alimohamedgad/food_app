// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:food_app/data/model/food_details.dart';

import '../../core/app_image/image.dart';

class FoodModel {
  final String id;
  final String userID;
  final String nameFood;
  final String image;
  final String category;
  final List<FoodDetailsModel>? priceAndSize;
  final String? bigSize;
  final dynamic mainPrice;
  final bool isFavorite;
  FoodModel({
    required this.id,
    required this.userID,
    required this.nameFood,
    required this.image,
    required this.category,
    this.priceAndSize,
    required this.bigSize,
    required this.mainPrice,
    required this.isFavorite,
  });
}

List<FoodModel> foodCart = [];
List<FoodModel> foodData = [
  FoodModel(
    bigSize: 'كبير',
    id: '1',
    userID: '1',
    nameFood: 'بيتزا فراخ',
    image: AppImage.pizza,
    category: 'بيتزا',
    priceAndSize: [FoodDetailsModel(price: 10, size: 'وسط')],
    isFavorite: true,
    mainPrice: 30,
  ),
  FoodModel(
    id: '2',
    userID: '1',
    bigSize: 'كبير',
    nameFood: 'بيتزا سوسيس',
    image: AppImage.pizza,
    category: 'بيتزا',
    priceAndSize: [
      FoodDetailsModel(price: 10, size: 'صغير'),
      FoodDetailsModel(price: 15, size: 'وسط'),
      FoodDetailsModel(price: 20, size: 'كبير'),
    ],
    isFavorite: true,
    mainPrice: 30,
  ),
  FoodModel(
    bigSize: 'كبير',
    id: '3',
    userID: '1',
    nameFood: 'برجر بالحمه',
    image: AppImage.burger,
    category: 'برجر',
    priceAndSize: [FoodDetailsModel(price: 10, size: 'وسط')],
    isFavorite: true,
    mainPrice: 10,
  ),
  FoodModel(
    bigSize: 'كبير',
    id: '4',
    userID: '1',
    nameFood: 'برجر بانيه',
    image: AppImage.burger,
    category: 'برجر',
    priceAndSize: [FoodDetailsModel(price: 10, size: 'وسط')],
    isFavorite: true,
    mainPrice: 10,
  ),
  FoodModel(
    bigSize: 'كبير',
    id: '5',
    userID: '1',
    nameFood: 'شاورما فراخ ',
    image: AppImage.shawrma,
    category: 'شاورما',
    priceAndSize: [FoodDetailsModel(price: 10, size: 'وسط')],
    isFavorite: true,
    mainPrice: 10,
  ),
  FoodModel(
    bigSize: 'كبير',
    id: '6',
    userID: '1',
    nameFood: 'شاورما لحمه ',
    image: AppImage.shawrma,
    category: 'شاورما',
    priceAndSize: [FoodDetailsModel(price: 10, size: 'وسط')],
    isFavorite: true,
    mainPrice: 20,
  ),
  FoodModel(
    bigSize: 'كبير',
    id: '7',
    userID: '1',
    nameFood: 'كريب فراخ ',
    image: AppImage.crepe,
    category: 'كريب',
    priceAndSize: [FoodDetailsModel(price: 10, size: 'وسط')],
    mainPrice: 30,
    isFavorite: true,
  ),
  FoodModel(
    bigSize: 'كبير',
    id: '8',
    userID: '1',
    nameFood: 'كريب لحمه ',
    image: AppImage.crepe,
    category: 'كريب',
    priceAndSize: [FoodDetailsModel(price: 10, size: 'وسط')],
    isFavorite: true,
    mainPrice: 30,
  ),
  FoodModel(
    bigSize: 'كبير',
    id: '9',
    userID: '1',
    nameFood: 'كريب سجق ',
    image: AppImage.crepe,
    category: 'كريب',
    mainPrice: 30,
    priceAndSize: [FoodDetailsModel(price: 10, size: 'وسط')],
    isFavorite: true,
  ),
  FoodModel(
    bigSize: 'كبير',
    id: '10',
    userID: '1',
    nameFood: 'كريب بانيه ',
    image: AppImage.crepe,
    category: 'كريب',
    priceAndSize: [
      FoodDetailsModel(price: 10, size: 'صغير'),
      FoodDetailsModel(price: 15, size: 'وسط'),
      FoodDetailsModel(price: 20, size: 'كبير'),
    ],
    mainPrice: 30,
    isFavorite: true,
  ),
];
