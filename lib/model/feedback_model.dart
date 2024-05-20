class Feedback {
  final String email;
  final double rating;

  Feedback({required this.email, required this.rating});

  factory Feedback.fromJson(Map<String, dynamic> json) {
    double parsedRating =
        (json['rating'] is int) ? json['rating'].toDouble() : json['rating'];
    return Feedback(
      email: json['email'],
      rating: parsedRating,
    );
  }
}
