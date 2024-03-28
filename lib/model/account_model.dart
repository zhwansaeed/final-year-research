class AccountModel {
  String? id;
  String  username, email, password;
  List<dynamic>? favoriteEvents, favoritePlaces;

  AccountModel(
      {
        this.id,
        required this.username,
        required this.email,
        required this.password,
        this.favoriteEvents,
        this.favoritePlaces
      }
      ){
    if (this.favoritePlaces == null) {
      this.favoritePlaces = [];
    }

    if(this.favoriteEvents == null) {
      this.favoriteEvents = [];
    }
  }

  @override
  String toString() {
    String output = "Account { ";

    output += "username: " + this.username + ", ";
    output += "email: " + this.email + ", ";
    output += "password: " + this.password + ", ";

    output += "favoriteEvents: [";
    this.favoriteEvents?.forEach((element) { output += element["id"].toString() + ", "; });
    if (favoriteEvents!.length > 0) {
      output = output.substring(0, output.length - 2);
    }
    output += "], ";



    output += "favoritePlaces: [";
    this.favoritePlaces?.forEach((element) { output += element["id"].toString() + ", "; });
    if (favoritePlaces!.length > 0)
    output = output.substring(0, output.length - 2);
    output += "]";

    output += " }\n";




    return output;
  }
}
