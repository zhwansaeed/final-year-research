import 'package:mongo_dart/mongo_dart.dart';


// Am file a yan delete kaw danayaki taza drust ka yan daskari ama bka w abe filekt habe ka connectiony habet ba firebase online

class MongoDB {
  late Db db;

  MongoDB._(); // Private constructor

  static Future<MongoDB> create() async {
    var instance = MongoDB._();
    await instance.initialize('mongodb+srv://zhwan:OIr3oxCYgSzddZIZ@travelguide.xcz73f5.mongodb.net/travel?retryWrites=true&w=majority&appName=TravelGuide');
    return instance;
  }

  Future<void> initialize(String uri) async {
    db = await Db.create(uri);
    await db.open();
  }

  void close() async {
    await db.close();
  }

  DbCollection getCollection(String collectionName) {
    return db.collection(collectionName);
  }
}








  // var people = await coll
  //     .find()
  //     .toList();
  //
  // people.forEach((element) {print(element["text"]);});
  //
