import 'package:flutter_application_1/database/mongo.dart';
import 'package:flutter_application_1/model/place_model.dart';
import 'package:mongo_dart/mongo_dart.dart';

import 'duplicate_exception.dart';

class PlaceRepository {
  late MongoDB mongoDB;
  late DbCollection placeCollection;

  PlaceRepository._();

  static Future<PlaceRepository> create() async {
    var instance = PlaceRepository._();
    await instance.initialize();
    return instance;
  }

  Future<void> initialize() async {
    this.mongoDB = await MongoDB.create();
    this.placeCollection = mongoDB.getCollection("places");
  }

  Future<void> insert(PlaceModel place) async {
    List<PlaceModel> list = await getList();

    for(int i = 0; i < list.length; i++) {
      PlaceModel placeModel = list[i];
      if(placeModel.id == place.id) {
        throw new DuplicateException("username","Duplicate place ids");
      }

      if(placeModel.englishTitle == place.englishTitle) {
        throw new DuplicateException("email", "Duplicate place name");
      }

      if(placeModel.kurdishTitle == place.kurdishTitle) {
        throw new DuplicateException("email", "Duplicate place name");
      }

    }

    await placeCollection.insertOne(
        {
          "id": place.id,
          "englishTitle": place.englishTitle,
          "kurdishTitle": place.kurdishTitle,
          "image": place.image,
          "latitude": place.latitude,
          "longitude": place.longitude,
          "feedbacks": place.feedbacks
        }
    );
  }

  Future<List<PlaceModel>> getList() async {
    var cursor = await placeCollection.find();
    List<PlaceModel> places = await cursor.map((document) => PlaceModel.fromJson(document)).toList();
    return places;
  }

  Future<void> addFeedback(PlaceModel place, String accountEmail, int rating) async {
    var exists = false;
    int index = 0;
    for(index = 0; index < place.feedbacks.length; index++) {
      print("=====");
      print(place.feedbacks[index].email);
      exists = accountEmail == place.feedbacks[index].email ? true : false;
      if(exists) {
        break;
      }
    }

    if(exists) {
      print("reached 1");
      await placeCollection.updateOne(
          {
            "id": place.id,
            "feedbacks.email": accountEmail
          },
          {
            "\$set": {
              "feedbacks.\$.rating": rating
            }
          }
      );
    } else {
      print("reached 2");
      await placeCollection.updateOne(
          {
            "id": place.id
          },
          {
            "\$push": {
              "feedbacks": {
                "email": accountEmail,
                "rating": rating
              }
            }
          }
      );
    }
  }

}

