import 'dart:io';

class AddProductInputEntity {
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

  AddProductInputEntity({
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
}
