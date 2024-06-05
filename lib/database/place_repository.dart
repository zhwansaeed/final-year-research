import 'dart:ffi';

import 'package:flutter_application_1/database/mongo.dart';
import 'package:flutter_application_1/model/place_model.dart';
import 'package:mongo_dart/mongo_dart.dart';

import 'duplicate_exception.dart';

class PlaceRepository {
  // amana replace bka ba connection w collectiony firebase
  late MongoDB mongoDB;                               //REPLACE ka 
  late DbCollection accountCollection;                //REPLACE ka 


  // daskari ama maka
  PlaceRepository._();



  // amana rek bxa ba pey connection firebase
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

    // wa bashtra daskari amana nakret magar zarwr bet, checky awa akat ka account aka bwni nabet bo away dwbara bwnawa rw nayat
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

    // code zyad krdni accountaka lera dabne bo firebase
  }

  Future<List<PlaceModel>> getList() async {
    List<PlaceModel> places = null;    // listek drust bka w place akani teka dwatr return ka
    return places;
  }




  // lera listek drust ka 
  Future<List<PlaceModel>> getListBasedOnFeedback() async {

    //listek la place return ka ka ba pey zortrin feedback sort krabn la zortrin feedback bo kamtrin feedback
    List<PlaceModel> places = null;
    
    return places;
  }



  Future<void> addFeedback(PlaceModel place, String accountEmail, double rating) async {

    // bashtra amana daskari nakren
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

      // agar place aka la feedbacki kasaka habw update bka

    } 
    
    // agar peshtr feedbacki bo am place a nayabw zyadi ka
    else {
      // agar account aka feedbacky nia lasar aw place a drusti ka
    }
  }


  // ba pey email user bdozarawa w dwatr bzana chanek feedbacky yawa ba shweneki dyari kraw ka ba id aidozinawa place aka
  Future<double> getRatingForUser(int placeId, String userEmail) async {

    // aw place a bdozarawa ka am placeId ayay haya
    var document = null;


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
    //rating akani placek ko karawa w average le dar kaw return ka, agar 0 rating habw 0.0 return ka
    var documents = null;
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

