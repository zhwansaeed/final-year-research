import 'dart:ffi';

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

    // connect krdni flutter ba collectiony "places"
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
    
    PlaceRepository placeRepository = await PlaceRepository.create();


    // Pipeline chan operationeka basar database aka jebaje abet
    var pipeline = [
      // op1: aw place anay favoriteyan nya layba
      { "\$unwind": {
        "path": "\$feedbacks",
        "preserveNullAndEmptyArrays": true
      }},
      // op2: aw placeanay mawatawa koyan karawa wakw listek
      { "\$group": {
        "_id": "\$_id",
        "id": { "\$first": "\$id" },
        "englishTitle": { "\$first": "\$englishTitle" },
        "kurdishTitle": { "\$first": "\$kurdishTitle" },
        "image": { "\$first": "\$image" },
        "latitude": { "\$first": "\$latitude" },
        "longitude": { "\$first": "\$longitude" },
        "averageRating": { "\$avg": "\$feedbacks.rating" } // 7sab krdni average rating
      }},
      // op3: list aka sort ka ba pey average rating descending (gawra bo bchwk)
      { "\$sort": { "averageRating": -1 } }
    ];

    // execute krdni pipeline aka
    var cursor = await placeRepository.placeCollection.aggregateToStream(pipeline);

    // anjami pipeline aka bka ba listeky place
    List<PlaceModel> places = await cursor.map((document) => PlaceModel.fromJsonAggregation(document)).toList();

    // return krdni listaka
    return places;
  }

  Future<void> addFeedback(PlaceModel place, String accountEmail, double rating) async {
    var exists = false;

    List<PlaceModel> places = await getList();

    // aw place a bdozarawa ka user aka ayawe feedbacki lasar bat
    for(var currentPlace in places) {
      if(currentPlace.id == place.id) {
        place = currentPlace;
      }
    }


    // sairi har feedbackek akat la place dyari krawaka
    for(var feedback in place.feedbacks) {

      //aya am kasa peshtr feedbacki yawa bam place ay esta dyari krdwa
      exists = accountEmail == feedback.email ? true : false;

      if(exists) {
        break;
      }
    }


    //agar peshtr feedbacky yabw ba place aka update ka
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
    } 
    
    // agar peshtr feedbacki bo am place a nayabw zyadi ka
    else {
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


  // ba pey email user bdozarawa w dwatr bzana chanek feedbacky yawa ba shweneki dyari kraw ka ba id aidozinawa place aka
  Future<double> getRatingForUser(int placeId, String userEmail) async {

    // aw place a bdozarawa ka am id ayay haya
    var document = await placeCollection.findOne({"id": placeId});


    // check bka bzana feedbacki yawa ba hich jorek
    if (document != null && document.containsKey('feedbacks') && document['feedbacks'] is List) {
      // feedbackakani user aka bdozarawa la hamw place akan
      List feedbacks = document['feedbacks'];
      var userFeedback = feedbacks.firstWhere(
              (fb) => fb['email'] == userEmail,
          orElse: () => null
      );

      // ka feedbacky userakat doziawa bigarenarawa
      if (userFeedback != null) {
        return userFeedback['rating'].toDouble();
      }
    }

    // agar feedbacky nabw 0 bgarenarawa
    return 0.0;
  }

  Future<double> getAverageRating(PlaceModel place) async {
    var documents = await placeCollection.find({"id": place.id}).toList();
    if (documents.isEmpty) {
      return 0.0;  // agar rating bwni nabw 0 bgarenarawa wakw average
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

