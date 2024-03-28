class PlaceModel {
  final String image, title;
  double latitude, longitude;
  final int id;

  PlaceModel({required this.id, required this.title, required this.image, required this.latitude, required this.longitude});
}

List<PlaceModel> places = [
  PlaceModel(
      id: 1,
      title: "زانكۆی سلێمانی",
      image: "assets/places/sulaymaniah-university.jpg",
      latitude: 35.5667,
      longitude: 45.443

  ),
  PlaceModel(
      id: 2, title: "زانكۆی گەشەپێدانی مرۆیی", image: "assets/places/uhd.jpg", latitude: 35.5292, longitude: 45.4967),
  PlaceModel(
      id: 3, title: "زانكۆی ئەمریكی سلێمانی", image: "assets/places/auis.png", latitude: 35.5728, longitude: 45.3535),
  PlaceModel(id: 4, title: "سەیرانگای دوكان", image: "assets/places/dukan.jpg", latitude: 36.1393, longitude: 44.9239),
  PlaceModel(
      id: 5, title: "هۆتێل تایتانیك", image: "assets/places/taitanic.jpg", latitude: 35.5754, longitude: 45.4674),
  PlaceModel(id: 6, title: "هۆتێل شاری جوان", image: "assets/places/grand.jpg", latitude: 35.5712, longitude: 45.4062),
  PlaceModel(
      id: 7,
      title: "سەیرانگایی چەمیڕێزان",
      image: "assets/places/chami-rezan.jpg",
      latitude: 35.7976,
      longitude: 44.9774
  ),
  PlaceModel(id: 8, title: "چییای گۆیژە", image: "assets/places/goizha.jpg", latitude: 35.5795, longitude: 45.4878),
  PlaceModel(id: 9, title: "سیتەک", image: "assets/places/sitak.jpg", latitude: 35.6382, longitude: 45.5155),
  PlaceModel(
      id: 10,
      title: "شاری پزیشكی فارووق",
      image: "assets/places/faruq-hospital.jpg",
      latitude: 35.5497,
      longitude: 45.4659
  ),
  PlaceModel(
      id: 11,
      title: "شاری یاری سلێمانی",
      image: "assets/places/parki-azadi.jpeg",
      latitude: 35.5643,
      longitude: 45.4325
  ),
  PlaceModel(id: 12, title: "چاڤیلاند", image: "assets/places/chavi-land.jpg", latitude: 35.5817, longitude: 45.4674),
  PlaceModel(
      id: 13,
      title: "سەیرانگای سەرچنار",
      image: "assets/places/sarchnar-park.jpg",
      latitude: 35.5888,
      longitude: 45.3823
  ),
  PlaceModel(
      id: 14,
      title: "نەخۆشخانەی شار",
      image: "assets/places/shar-hospital.jpeg",
      latitude: 35.5813,
      longitude: 45.4427
  ),
  PlaceModel(
      id: 15, title: "تونێل پێشڕەو", image: "assets/places/tonel-peshraw.jpeg", latitude: 35.62206934270112, longitude: 45.477540428835496),
  PlaceModel(id: 16, title: "مێرگەپان", image: "assets/places/mergapan.jpg", latitude: 35.83349711114794, longitude: 45.1727985637109),
  PlaceModel(
      id: 17,
      title: "نەخۆشخانەی هیوا",
      image: "assets/places/hiwa-hospital.jpg",
      latitude: 35.5417,
      longitude:45.4510
  ),
];
