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
  final String? size;
  final dynamic price;
  final bool isFavorite;
  int? quantity;
  FoodModel({
    required this.id,
    required this.userID,
    required this.nameFood,
    required this.image,
    required this.category,
    this.priceAndSize,
    this.size = 'صغير',
    this.price = 0,
    required this.isFavorite,
    this.quantity = 1,
  });
}

List<FoodModel> foodCart = [];
List<FoodModel> foodData = [
  FoodModel(
    size: 'كبير',
    id: '1',
    userID: '1',
    nameFood: 'بيتزا فراخ',
    image: AppImage.pizza,
    category: 'بيتزا',
    priceAndSize: [
      FoodDetailsModel(price: 30, size: 'صغير'),
      FoodDetailsModel(price: 45, size: 'وسط'),
      FoodDetailsModel(price: 65, size: 'كبير'),
    ],
    isFavorite: true,
    price: 30,
  ),
  FoodModel(
    id: '2',
    userID: '1',
    size: 'كبير',
    nameFood: 'بيتزا سوسيس',
    image: AppImage.pizza,
    category: 'بيتزا',
    priceAndSize: [
      FoodDetailsModel(price: 30, size: 'صغير'),
      FoodDetailsModel(price: 45, size: 'وسط'),
      FoodDetailsModel(price: 65, size: 'كبير'),
    ],
    isFavorite: true,
    price: 30,
  ),
  FoodModel(
    size: 'كبير',
    id: '3',
    userID: '1',
    nameFood: 'برجر بالحمه',
    image: AppImage.burger,
    category: 'برجر',
    priceAndSize: [
      FoodDetailsModel(price: 15, size: 'صغير'),
      FoodDetailsModel(price: 20, size: 'وسط'),
      FoodDetailsModel(price: 25, size: 'كبير'),
    ],
    isFavorite: true,
    price: 10,
  ),
  FoodModel(
    size: 'كبير',
    id: '5',
    userID: '1',
    nameFood: 'شاورما فراخ ',
    image: AppImage.shawrma,
    category: 'شاورما',
    priceAndSize: [
      FoodDetailsModel(price: 15, size: 'صغير'),
      FoodDetailsModel(price: 20, size: 'وسط'),
      FoodDetailsModel(price: 25, size: 'كبير'),
    ],
    isFavorite: true,
    price: 10,
  ),
  FoodModel(
    size: 'كبير',
    id: '6',
    userID: '1',
    nameFood: 'شاورما لحمه ',
    image: AppImage.shawrma,
    category: 'شاورما',
    priceAndSize: [
      FoodDetailsModel(price: 15, size: 'صغير'),
      FoodDetailsModel(price: 20, size: 'وسط'),
      FoodDetailsModel(price: 25, size: 'كبير'),
    ],
    isFavorite: true,
    price: 20,
  ),
  FoodModel(
    size: 'كبير',
    id: '7',
    userID: '1',
    nameFood: 'كريب فراخ ',
    image: AppImage.crepe,
    category: 'كريب',
    priceAndSize: [
      FoodDetailsModel(price: 15, size: 'صغير'),
      FoodDetailsModel(price: 20, size: 'وسط'),
      FoodDetailsModel(price: 25, size: 'كبير'),
    ],
    price: 30,
    isFavorite: true,
  ),
  FoodModel(
    size: 'كبير',
    id: '8',
    userID: '1',
    nameFood: 'كريب لحمه ',
    image: AppImage.crepe,
    category: 'كريب',
    priceAndSize: [
      FoodDetailsModel(price: 30, size: 'صغير'),
      FoodDetailsModel(price: 45, size: 'وسط'),
      FoodDetailsModel(price: 55, size: 'كبير'),
    ],
    isFavorite: true,
    price: 30,
  ),
  FoodModel(
    size: 'كبير',
    id: '9',
    userID: '1',
    nameFood: 'كريب سجق ',
    image: AppImage.crepe,
    category: 'كريب',
    price: 30,
    priceAndSize: [
      FoodDetailsModel(price: 15, size: 'صغير'),
      FoodDetailsModel(price: 20, size: 'وسط'),
      FoodDetailsModel(price: 25, size: 'كبير'),
    ],
    isFavorite: true,
  ),
  FoodModel(
    size: 'كبير',
    id: '10',
    userID: '1',
    nameFood: 'كريب بانيه ',
    image: AppImage.crepe,
    category: 'كريب',
    priceAndSize: [
      FoodDetailsModel(price: 15, size: 'صغير'),
      FoodDetailsModel(price: 20, size: 'وسط'),
      FoodDetailsModel(price: 25, size: 'كبير'),
    ],
    price: 30,
    isFavorite: true,
  ),
];
