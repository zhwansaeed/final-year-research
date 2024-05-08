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



  Future<List<PlaceModel>> getListBasedOnFeedback() async {
    PlaceRepository placeRepository = await PlaceRepository.create();  // Assume PlaceRepository is set up for MongoDB access

    var pipeline = [
      // Unwind the feedbacks array to process each feedback individually
      { "\$unwind": {
        "path": "\$feedbacks",
        "preserveNullAndEmptyArrays": true // Preserves places without feedbacks or with empty feedbacks array
      }},
      // Group by original document ID, calculating the average rating
      { "\$group": {
        "_id": "\$_id",
        "id": { "\$first": "\$id" }, // Keep original fields
        "englishTitle": { "\$first": "\$englishTitle" },
        "kurdishTitle": { "\$first": "\$kurdishTitle" },
        "image": { "\$first": "\$image" },
        "latitude": { "\$first": "\$latitude" },
        "longitude": { "\$first": "\$longitude" },
        "averageRating": { "\$avg": "\$feedbacks.rating" } // Calculate the average rating
      }},
      // Sort documents by the calculated average rating in descending order
      { "\$sort": { "averageRating": -1 } }
    ];

    var cursor = await placeRepository.placeCollection.aggregateToStream(pipeline);
    List<PlaceModel> places = await cursor.map((document) => PlaceModel.fromJsonAggregation(document)).toList();
    print(places);
    return places;
  }

  Future<void> addFeedback(PlaceModel place, String accountEmail, double rating) async {
    var exists = false;
    int index = 0;
    for(index = 0; index < place.feedbacks.length; index++) {
      print(place.feedbacks[index].email);
      exists = accountEmail == place.feedbacks[index].email ? true : false;
      if(exists) {
        break;
      }
    }

    if(exists) {
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


  Future<double> getAverageRating(PlaceModel place) async {
    var documents = await placeCollection.find({"id": place.id}).toList();
    if (documents.isEmpty) {
      return 0.0; // No feedback means a default rating of 0
    }

    double totalRating = 0;
    int count = 0;
    for (var doc in documents) {
      for (var feedback in doc['feedbacks']) {
        totalRating += feedback['rating'];
        count++;
      }
    }

    return count > 0 ? totalRating / count : 0.0;
  }

}

