import 'dart:io';

import 'package:fruitify_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
  final String productName;
  final String price;
  final String code;
  final String description;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int calories;
  final int unit;
  num avgRating;
  num ratingCount;

  AddProductInputModel({
    required this.productName,
    required this.price,
    required this.code,
    required this.description,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationMonths,
    required this.calories,
    required this.unit,
    required this.isOrganic,
    this.avgRating = 0,
    this.ratingCount = 0,
  });

  factory AddProductInputModel.fromEntity(AddProductInputEntity entity) {
    return AddProductInputModel(
      productName: entity.productName,
      price: entity.price,
      code: entity.code,
      description: entity.description,
      image: entity.image,
      isFeatured: entity.isFeatured,
      imageUrl: entity.imageUrl,
      expirationMonths: entity.expirationMonths,
      calories: entity.calories,
      unit: entity.unit,
      isOrganic: entity.isOrganic,
      avgRating: entity.avgRating,
      ratingCount: entity.ratingCount,
    );
  }

  dynamic toJson() => {
    'productName': productName,
    'price': price,
    'code': code,
    'description': description,
    'isFeatured': isFeatured,
    'imageUrl': imageUrl,
    'expirationMonths': expirationMonths,
    'calories': calories,
    'unit': unit,
    'isOrganic': isOrganic,
    'avgRating': avgRating,
    'ratingCount': ratingCount,
  };
}
