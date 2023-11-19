import 'package:equatable/equatable.dart';
import 'package:shop_app_data_providers/domains/store_repository/models/category.dart';

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

  factory Product.fromMap(Map<dynamic, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'],
      rating: map['rating'],
      price: map['price'],
      image: map['Image'],
      description: map['description'],
      category: Category.fromMap(map['category']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'rating': rating,
      'price': price,
      'Image': image,
      'description': description,
      'category': category.toMap(),
    };
  }

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
