class Feedback {
  final String email;
  final int rating;

  Feedback({required this.email, required this.rating});

  factory Feedback.fromJson(Map<String, dynamic> json) {
    return Feedback(
      email: json['email'],
      rating: json['rating'],
    );
  }
}
