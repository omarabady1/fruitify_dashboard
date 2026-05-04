import 'dart:io';

import 'package:fruitify_dashboard/features/add_product/domain/entities/review_entity.dart';

class ProductEntity {
  final String productName;
  final double price;
  final String code;
  final String description;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int calories;
  final int unit;
  num amount;
  num avgRating;
  num ratingCount;
  final List<ReviewEntity> reviews;

  ProductEntity({
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
    this.amount = 1,
    required this.reviews,
    
  });
}
