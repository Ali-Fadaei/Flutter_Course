import 'package:shop_app_bloc/domains/store_repository/models/category.dart';

class Product {
//
  final int id;

  final String title;

  final double rating;

  final int price;

  final String image;

  final String description;

  final Category category;

  Product({
    required this.id,
    required this.title,
    required this.rating,
    required this.price,
    required this.image,
    required this.description,
    required this.category,
  });
}
