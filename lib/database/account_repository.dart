import 'package:flutter_application_1/database/duplicate_exception.dart';
import 'package:flutter_application_1/database/mongo.dart';
import 'package:flutter_application_1/model/account_model.dart';
import 'package:flutter_application_1/model/event_model.dart';
import 'package:flutter_application_1/model/eventmodel.dart';
import 'package:flutter_application_1/model/place_model.dart';
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

    //connect krdni flutter ba collectiony "accounts"
    this.accountCollection = mongoDB.getCollection("accounts");
  }


  // insert krdni accountek abet objecteki account model wargrin
  Future<void> insert(AccountModel account) async {

    //listy accountakan agareninawa
    List<AccountModel> list = await getList();

    //searchy hamw accountakan akain la listaka
    for (int i = 0; i < list.length; i++) {

      //am accountay estay loop aka wargra
      AccountModel accountModel = list[i];

      //am accountay estay loop aka haman username y haya lagal away bo function aka nerdrawa
      if (accountModel.username == account.username) {

        // zyady maka w la function aka bcho darawa
        throw new DuplicateException("username", "Duplicate username");
      }

      //am accountay estay loop aka haman email y haya lagal away bo function aka nerdrawa
      if (accountModel.email == account.email) {

        // zyady maka w la function aka bcho darawa
        throw new DuplicateException("email", "Duplicate email");
      }
    }

    // ka dwbara bwnawa nabw zyay ka la database aka
    await accountCollection.insertOne({
      "username": account.username,
      "email": account.email,
      "password": account.password,
      "favoriteEvents": account.favoriteEvents,
      "favoritePlaces": account.favoritePlaces,
    });
  }


  // zya krdni event ek bo favoritey user aka ba pey email akay
  Future<void> addEvent(String email, EventModel event) async {

    //update y user aka bka ba pey email akay w EventModel aka bkara naw favority accountakay haman emaily haya
    accountCollection.updateOne(
        where.eq("email", email), modify.addToSet("favoriteEvents", event.id));
  }

  Future<void> addEvent2(String email, EventModel2 event) async {
    accountCollection.updateOne(
        where.eq("email", email), modify.addToSet("favoriteEvents", event.id));
  }


  //bo labrdni place ek la accountaka ba pey emaily account aka w id y event aka
  Future<void> removeEvent(String email, int placeId) async {
    accountCollection.updateOne(
        where.eq("email", email), modify.pull("favoritePlaces", placeId));
  }

  // add krdni placek ba pey id akay bo accountek ba pey emaily account aka
  Future<void> addPlace(String email, PlaceModel place) async {

    //idy place aka zya bka bo user aka ba pey email akay
    accountCollection.updateOne(
        where.eq("email", email), modify.addToSet("favoritePlaces", place.id));
  }

  // remove krdi pladcek la favorite ba pey id la accountek ka ba pey email doziwmanatawa
  Future<void> removePlace(String email, int placeId) async {
    accountCollection.updateOne(
        where.eq("email", email), modify.pull("favoritePlaces", placeId));
  }

  Future<AccountModel?> login(email, password) async {

    //find one yani yak account bgarenarawa agar empty bw wata aw kasa accounty nia
    Map<String, dynamic>? document = await accountCollection
        .findOne(where.eq("email", email).eq("password", password));

    return document == null
        ? null
        : AccountModel(
            username: document?["username"],
            email: document?["email"],
            password: document?["password"],
            favoritePlaces: document?["favoritePlaces"],
            favoriteEvents: document?["favoriteEvents"]);
  }


  // hamw document akani database aka agarenetawa w aikat ba listeki AccountModel
  Future<List<AccountModel>> getList() async {
    List<AccountModel> accounts = await accountCollection
        .find()  //hamw documentakan bgarenarawa
        .map((document) => AccountModel( // account akan hamwi bka ba objecty AccountModel
            username: document["username"],
            email: document["email"],
            password: document["password"],
            favoriteEvents: document["favoriteEvents"],
            favoritePlaces: document["favoritePlaces"]))
        .toList();   // document akani krdman ba objecty AccountModel hamwian ko karawa la listeka 

    // list aka bgarenarawa
    return accounts;
  }


  // daxstni connectiony databasaka ba tawawi ....  nak collectionaka
  void close() {
    mongoDB.close();
  }
}
