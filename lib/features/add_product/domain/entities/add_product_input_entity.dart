import 'dart:io';

class AddProductInputEntity {
  final String productName;
  final String price;
  final String code;
  final String description;
  final File image;
  final bool isFeatured;
  final String? imageUrl;

  AddProductInputEntity({
    required this.productName,
    required this.price,
    required this.code,
    required this.description,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
  });
}
