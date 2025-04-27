import 'package:flutter/material.dart';

class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final String category;
  final RatingModel rating;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
    required this.rating,
  });
  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData["id"],
      title: jsonData["title"],
      price: jsonData["price"],
      description: jsonData["description"],
      image: jsonData["image"],
      category: jsonData["category"],
      rating: jsonData["rating"] != null
          ? RatingModel.fromJson(jsonData["rating"])
          : RatingModel(rate: 0.0, count: 0),
    );
  }
}

class RatingModel {
  final dynamic rate;
  final int count;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(Map<String, dynamic> jsonData) {
    return RatingModel(rate: jsonData["rate"], count: jsonData["count"]);
  }
}
