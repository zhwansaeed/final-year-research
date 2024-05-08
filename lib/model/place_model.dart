import 'package:flutter_application_1/model/feedback_model.dart';

class PlaceModel {
  final int id;
  final String englishTitle;
  final String kurdishTitle;
  final String image;
  final double latitude;
  final double longitude;
  final List<Feedback> feedbacks;

  PlaceModel({
    required this.id,
    required this.englishTitle,
    required this.kurdishTitle,
    required this.image,
    required this.latitude,
    required this.longitude,
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
    );
  }
}


// List<PlaceModel> places = [
//   PlaceModel(
//       id: 1,
//       englishTitle: "UOS University of Sulaimani",
//       kurdishTitle: "زانكۆی سلێمانی",
//       image: "assets/places/sulaymaniah-university.jpg",
//       latitude: 35.5667,
//       longitude: 45.443,
//     feedbacks: []
//
//   ),
//   PlaceModel(
//       id: 2, englishTitle: "UHD university of Human Development", kurdishTitle: "زانكۆی گەشەپێدانی مرۆیی", image: "assets/places/uhd.jpg", latitude: 35.5292, longitude: 45.4967, feedbacks: []),
//   PlaceModel(
//       id: 3, englishTitle: "American University of Sulaimani", kurdishTitle: "زانكۆی ئەمریكی سلێمانی", image: "assets/places/auis.png", latitude: 35.5728, longitude: 45.3535, feedbacks: []),
//   PlaceModel(id: 4, englishTitle: "Dukan Lake", kurdishTitle: "سەیرانگای دوكان", image: "assets/places/dukan.jpg", latitude: 36.1393, longitude: 44.9239, feedbacks: []),
//   PlaceModel(
//       id: 5, englishTitle: "Hotel Titanic", kurdishTitle: "هۆتێل تایتانیك", image: "assets/places/taitanic.jpg", latitude: 35.5754, longitude: 45.4674, feedbacks: []),
//   PlaceModel(id: 6, englishTitle: "Grand Millennium Hotel", kurdishTitle: "هۆتێل شاری جوان", image: "assets/places/grand.jpg", latitude: 35.5712, longitude: 45.4062, feedbacks: []),
//   PlaceModel(
//       id: 7,
//       englishTitle: "Chami Rezan",
//       kurdishTitle: "سەیرانگایی چەمیڕێزان",
//       image: "assets/places/chami-rezan.jpg",
//       latitude: 35.7976,
//       longitude: 44.9774,
//       feedbacks: []
//   ),
//   PlaceModel(
//     id: 8, englishTitle: "Goizha mountain", kurdishTitle: "چییای گۆیژە", image: "assets/places/goizha.jpg", latitude: 35.5795, longitude: 45.4878, feedbacks: []),
//   PlaceModel(
//     id: 9, englishTitle: "Sitak", kurdishTitle:  "سیتەک", image: "assets/places/sitak.jpg", latitude: 35.6382, longitude: 45.5155, feedbacks: []),
//   PlaceModel(
//       id: 10,
//       englishTitle: "Faruq Medical City",
//       kurdishTitle: "شاری پزیشكی فارووق",
//       image: "assets/places/faruq-hospital.jpg",
//       latitude: 35.5497,
//       longitude: 45.4659,
//       feedbacks: []
//   ),
//   PlaceModel(
//       id: 11,
//       englishTitle: "Sulaimani Game City",
//       kurdishTitle: "شاری یاری سلێمانی",
//       image: "assets/places/parki-azadi.jpeg",
//       latitude: 35.5643,
//       longitude: 45.4325,
//       feedbacks: []
//   ),
//   PlaceModel(id: 12, englishTitle: "Chaviland", kurdishTitle: "چاڤیلاند", image: "assets/places/chavi-land.jpg", latitude: 35.5817, longitude: 45.4674, feedbacks: []),
//   PlaceModel(
//       id: 13,
//       englishTitle: "Sarchnar park",
//       kurdishTitle: "سەیرانگای سەرچنار",
//       image: "assets/places/sarchnar-park.jpg",
//       latitude: 35.5888,
//       longitude: 45.3823,
//     feedbacks: []
//   ),
//   PlaceModel(
//       id: 14,
//       englishTitle: "Shar Hospital",
//       kurdishTitle: "نەخۆشخانەی شار",
//       image: "assets/places/shar-hospital.jpeg",
//       latitude: 35.5813,
//       longitude: 45.4427,
//     feedbacks: []
//   ),
//   PlaceModel(
//       id: 15, englishTitle: "Peshraw Tunnel", kurdishTitle: "تونێل پێشڕەو", image: "assets/places/tonel-peshraw.jpeg", latitude: 35.62206934270112, longitude: 45.477540428835496, feedbacks: []),
//   PlaceModel(id: 16, englishTitle: "Mergapan", kurdishTitle: "مێرگەپان", image: "assets/places/mergapan.jpg", latitude: 35.83349711114794, longitude: 45.1727985637109, feedbacks: []),
//   PlaceModel(
//       id: 17,
//       englishTitle: "Hiwa Hostpital",
//       kurdishTitle: "نەخۆشخانەی هیوا",
//       image: "assets/places/hiwa-hospital.jpg",
//       latitude: 35.5417,
//       longitude:45.4510,
//       feedbacks: []
//   ),
// ];
