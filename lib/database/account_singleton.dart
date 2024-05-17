import 'package:geolocator/geolocator.dart';


//bo xazn krdni aw user ay login bwa bo away system aka biri bmene kam useraya esta esh ba applicationakay akat
class SingletonAccount {
  // Private static instance of the class
  static final SingletonAccount _instance = SingletonAccount._internal();

  // Public field representing user data, adjust according to your needs
  String username;
  String email;
  String password;
  List<String> favoritePlaces;
  List<String> favoriteEvents;



  // Add other account properties here



  // Private named constructor
  SingletonAccount._internal({this.username = '', this.email = '', this.password = '', this.favoritePlaces = const [], this.favoriteEvents = const []});

  // Factory constructor to return the singleton instance
  factory SingletonAccount() {
    return _instance;
  }

  // Public static method to access the singleton instance
  static SingletonAccount get instance => _instance;


// Add more functionality to the Account class as needed
}