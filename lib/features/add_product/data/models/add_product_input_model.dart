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

  AddProductInputModel({
    required this.productName,
    required this.price,
    required this.code,
    required this.description,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
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
    );
  }

  dynamic toJson() => {
    'productName': productName,
    'price': price,
    'code': code,
    'description': description,
    'image': image,
    'isFeatured': isFeatured,
    'imageUrl': imageUrl,
  };
}
