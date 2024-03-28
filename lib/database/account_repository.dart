import 'package:flutter_application_1/database/duplicate_exception.dart';
import 'package:flutter_application_1/database/mongo.dart';
import 'package:flutter_application_1/model/account_model.dart';
import 'package:flutter_application_1/model/event_model.dart';
import 'package:flutter_application_1/model/eventmodel.dart';
import 'package:flutter_application_1/model/place_model.dart';
import 'package:flutter_application_1/model/placemodel.dart';
import 'package:mongo_dart/mongo_dart.dart';

class AccountRepository {
  late MongoDB mongoDB;
  late DbCollection accountCollection;


  AccountRepository._();

  static Future<AccountRepository> create() async {
    var instance = AccountRepository._();
    await instance.initialize();
    return instance;
  }

  Future<void> initialize() async {
    this.mongoDB = await MongoDB.create();
    this.accountCollection = mongoDB.getCollection("accounts");
  }

  Future<void> insert(AccountModel account) async {
    List<AccountModel> list = await getList();

    for(int i = 0; i < list.length; i++) {
      AccountModel accountModel = list[i];
      if(accountModel.username == account.username) {
        throw new DuplicateException("username","Duplicate username");
      }

      if(accountModel.email == account.email) {
        throw new DuplicateException("email", "Duplicate email");
      }

    }

    await accountCollection.insertOne(
        {
          "username": account.username,
          "email": account.email,
          "password": account.password,
          "favoriteEvents": account.favoriteEvents,
          "favoritePlaces": account.favoritePlaces,
        }
    );
  }

  Future<void> addEvent(String email, EventModel event) async {
    accountCollection.updateOne(where.eq("email", email), modify.addToSet(
        "favoriteEvents", event.id));
  }

  Future<void> addEvent2(String email, EventModel2 event) async {
    accountCollection.updateOne(where.eq("email", email), modify.addToSet(
        "favoriteEvents", event.id));
  }

  Future<void> removeEvent(String email, int placeId) async {
    accountCollection.updateOne(where.eq("email", email), modify.pull("favoritePlaces", placeId));
  }


  Future<void> addPlace(String email, PlaceModel place) async {
    accountCollection.updateOne(where.eq("email", email), modify.addToSet(
        "favoritePlaces", place.id));
  }

  Future<void> addPlace2(String email, PlaceModel22 place) async {
    accountCollection.updateOne(where.eq("email", email), modify.addToSet(
        "favoritePlaces", place.id));
  }

  Future<void> removePlace(String email, int placeId) async {
    accountCollection.updateOne(where.eq("email", email), modify.pull("favoritePlaces", placeId));
  }


  Future<AccountModel?> login(email, password) async {
    Map<String, dynamic>? document = await accountCollection
        .findOne(where.eq("email", email).eq("password", password));


    return document == null ?
    null :
    AccountModel(username: document?["username"], email: document?["email"], password: document?["password"], favoritePlaces: document?["favoritePlaces"], favoriteEvents: document?["favoriteEvents"]);
  }



  Future<List<AccountModel>> getList() async {
    List<AccountModel> accounts =
    await accountCollection
        .find()
        .map((document) => AccountModel(username: document["username"], email: document["email"], password: document["password"], favoriteEvents: document["favoriteEvents"], favoritePlaces: document["favoritePlaces"]))
        .toList();
    return accounts;
  }




  void close() {
    mongoDB.close();
  }
}
