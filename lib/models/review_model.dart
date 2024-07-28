class ReviewModel {
  String? id;
  final String name;
  final String description;
  final String date;
  final int rating;
  bool? isUpdated;

  ReviewModel({
    this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.rating,
    this.isUpdated,
  });

  Map<String, dynamic> toJson(bool isUpdated) => {
    'name': name,
    'description': description,
    'date': date,
    'rating': rating,
    'isUpdated': isUpdated
  };
}
