import 'package:equatable/equatable.dart';
import 'package:shop_app_gorouter/domains/store_repository/models/category.dart';

class Product extends Equatable {
//
  final int id;

  final String title;

  final double rating;

  final int price;

  final String image;

  final String description;

  final Category category;

  const Product({
    required this.id,
    required this.title,
    required this.rating,
    required this.price,
    required this.image,
    required this.description,
    required this.category,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        rating,
        price,
        image,
        description,
        category,
      ];
}
