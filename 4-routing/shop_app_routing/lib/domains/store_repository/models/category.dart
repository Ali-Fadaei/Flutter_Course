import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
//
  final int id;

  final String title;

  final String image;

  final Color color;

  const Category({
    required this.id,
    required this.title,
    required this.image,
    required this.color,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        image,
        color,
      ];
}
