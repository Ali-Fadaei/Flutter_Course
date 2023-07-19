import 'package:flutter/material.dart';

class Category {
//
  final UniqueKey id;

  final String title;

  final String image;

  final Color color;

  Category({
    required this.title,
    required this.image,
    required this.color,
  }) : id = UniqueKey();
}
