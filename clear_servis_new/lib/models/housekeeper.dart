class Housekeeper {
  final String id;
  final String firstName;
  final String lastName;
  final String city;
  final String country;
  final String imageUrl;
  final double rating;
  final List<String> availableDates;

  Housekeeper({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.country,
    required this.imageUrl,
    required this.rating,
    required this.availableDates,
  });

  factory Housekeeper.fromJson(Map<String, dynamic> json) {
    return Housekeeper(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      city: json['city'],
      country: json['country'],
      imageUrl: json['imageUrl'],
      rating: json['rating'].toDouble(),
      availableDates: List<String>.from(json['availableDates']),
    );
  }
}
