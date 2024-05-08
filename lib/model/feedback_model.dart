class Feedback {
  final String email;
  final double rating;

  Feedback({required this.email, required this.rating});

  factory Feedback.fromJson(Map<String, dynamic> json) {
    // Check if the rating is an integer and convert it to double if so
    double parsedRating = (json['rating'] is int) ? json['rating'].toDouble() : json['rating'];
    return Feedback(
      email: json['email'],
      rating: parsedRating,
    );
  }
}