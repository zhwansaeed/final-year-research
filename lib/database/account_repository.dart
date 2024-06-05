import 'package:flutter_application_1/database/duplicate_exception.dart';
import 'package:flutter_application_1/database/mongo.dart';
import 'package:flutter_application_1/model/account_model.dart';
import 'package:flutter_application_1/model/event_model.dart';
import 'package:flutter_application_1/model/eventmodel.dart';
import 'package:flutter_application_1/model/place_model.dart';
import 'package:mongo_dart/mongo_dart.dart';

class AccountRepository {

  // amana replace bka ba connection w collectiony firebase
  late MongoDB mongoDB;                               //REPLACE ka 
  late DbCollection accountCollection;                //REPLACE ka 


  //daskari ama maka
  AccountRepository._();


  // amana rek bxa ba pey connection firebase
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


    // wa bashtra daskari amana nakret magar zarwr bet, checky awa akat ka account aka bwni nabet bo away dwbara bwnawa rw nayat

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


    // code zyad krdni accountaka lera dabne bo firebase
  }


  // zya krdni event ek bo favoritey user aka ba pey email akay
  Future<void> addEvent(String email, EventModel event) async {
    // code bo add krdni event ek bo account aka wakw favorite, account ba pey email bdozara w eventaka wakw favorite zya ka
  }

  Future<void> addEvent2(String email, EventModel2 event) async {
    // code bo add krdni event ek bo account aka wakw favorite, account ba pey email bdozara w eventaka wakw favorite zya ka
  }


  //bo labrdni place ek la accountaka ba pey emaily account aka w id y event aka
  Future<void> removeEvent(String email, int eventId) async {
    //code remove krdni event ek la favorite, ba pey email account aka bdozarawa w ba pey id event aka remove ka
  }

  // add krdni placek ba pey id akay bo accountek ba pey emaily account aka
  Future<void> addPlace(String email, PlaceModel place) async {
    // add krdni placek wakw favorite, ba pey email accountaka bdozaraw w place aka daxl ka (place ba pey id daxl ka bashtra)
  }

  // remove krdi pladcek la favorite ba pey id la accountek ka ba pey email doziwmanatawa
  Future<void> removePlace(String email, int placeId) async {
    //code remove krdni place, ba pey email kasaka bdozraw w place aka ba pey id remove ka
  }

  Future<AccountModel?> login(email, password) async {

    AccountModel model = null; // la jyati ama login bka w aw accountay haya returny ka, agar nabw null return ka

    return model;
  }


  // hamw document akani database aka agarenetawa w aikat ba listeki AccountModel
  Future<List<AccountModel>> getList() async {
    List<AccountModel> accounts = null;   // listek la account drust kaw returny ka
    
    return accounts;
  }


  // daxstni connectiony databasaka ba tawawi ....  nak collectionaka
  void close() {
    //replace bka ba close krdni firebase
    mongoDB.close();
  }
}
