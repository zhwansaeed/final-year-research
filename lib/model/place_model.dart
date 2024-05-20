import 'package:flutter_application_1/model/feedback_model.dart';

class PlaceModel {
  final int id;
  final String englishTitle;
  final String kurdishTitle;
  final String image;
  final double latitude;
  final double longitude;
  final double averageRating;
  final List<Feedback> feedbacks;

  PlaceModel({
    required this.id,
    required this.englishTitle,
    required this.kurdishTitle,
    required this.image,
    required this.latitude,
    required this.longitude,
    required this.averageRating,
    required this.feedbacks,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    List<Feedback> feedbacks = (json['feedbacks'] as List)
        .map((item) => Feedback.fromJson(item))
        .toList();

    return PlaceModel(
      id: json['id'],
      englishTitle: json['englishTitle'],
      kurdishTitle: json['kurdishTitle'],
      image: json['image'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      feedbacks: feedbacks,
      averageRating: json['averageRating'] ?? 0.0,
    );
  }

  factory PlaceModel.fromJsonAggregation(Map<String, dynamic> json) {
    List<Feedback> feedbacks = [];
    double averageRating = 0.0;

    if (json['feedbacks'] != null && json['feedbacks'].isNotEmpty) {
      feedbacks = (json['feedbacks'] as List)
          .map((item) => Feedback.fromJson(item))
          .toList();
      averageRating = feedbacks.isNotEmpty
          ? feedbacks.map((f) => f.rating).reduce((a, b) => a + b) /
              feedbacks.length
          : 0.0;
    }

    return PlaceModel(
      id: json['id'],
      englishTitle: json['englishTitle'],
      kurdishTitle: json['kurdishTitle'],
      image: json['image'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      averageRating: json['averageRating'] ?? averageRating,
      feedbacks: feedbacks,
    );
  }
}
