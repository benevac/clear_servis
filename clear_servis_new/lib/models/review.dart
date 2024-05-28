class Review {
  final String id;
  final String housekeeperId;
  final String userId;
  final String userName;
  final double rating;
  final String comment;

  Review({
    required this.id,
    required this.housekeeperId,
    required this.userId,
    required this.userName,
    required this.rating,
    required this.comment,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      housekeeperId: json['housekeeperId'],
      userId: json['userId'],
      userName: json['userName'],
      rating: json['rating'].toDouble(),
      comment: json['comment'],
    );
  }
}
