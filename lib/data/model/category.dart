// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:food_app/core/app_image/image.dart';

class Category {
  final String image;
  final String name;
  Category({
    required this.image,
    required this.name,
  });
}

List<Category> categoryData = [
  Category(
    image: AppImage.crepe,
    name: 'كريب',
  ),
  Category(
    image: AppImage.burger,
    name: 'برجر',
  ),
  Category(
    image: AppImage.pizza,
    name: 'بيتزا',
  ),
  Category(
    image: AppImage.shawrma,
    name: 'شاورما',
  ),
];
