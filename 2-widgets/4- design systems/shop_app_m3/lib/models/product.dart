import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/category.dart';

class Product {
//
  final UniqueKey id;

  final String title;

  final double rating;

  final int price;

  final String image;

  final String description;

  final Category category;
  int count;
  Product({
    required this.title,
    required this.rating,
    required this.price,
    required this.image,
    required this.description,
    required this.category,
    this.count = 1
  }) : id = UniqueKey();
}
