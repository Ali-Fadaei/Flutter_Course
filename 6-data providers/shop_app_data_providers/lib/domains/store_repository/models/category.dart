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

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      title: map['title'],
      image: map['Image'],
      color: Color(int.parse(map['color'])),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'Image': image,
      'color': color.value.toString(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        image,
        color,
      ];
}
