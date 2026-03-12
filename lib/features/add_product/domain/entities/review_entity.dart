class ReviewEntity {
  final String name;
  final String image;
  final int rating;
  final String reviewDescription;
  final DateTime createdAt;

  ReviewEntity({
    required this.name,
    required this.image,
    required this.rating,
    required this.reviewDescription,
    required this.createdAt,
  });
}