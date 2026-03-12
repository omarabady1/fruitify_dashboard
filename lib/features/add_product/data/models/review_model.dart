import 'package:fruitify_dashboard/features/add_product/domain/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final int rating;
  final String reviewDescription;
  final DateTime createdAt;

  ReviewModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.reviewDescription,
    required this.createdAt,
  });

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      name: entity.name,
      image: entity.image,
      rating: entity.rating,
      reviewDescription: entity.reviewDescription,
      createdAt: entity.createdAt,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      rating: json['rating'],
      reviewDescription: json['reviewDescription'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'image': image,
    'rating': rating,
    'reviewDescription': reviewDescription,
    'createdAt': createdAt.toIso8601String(),
  };
}