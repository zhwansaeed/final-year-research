class Post {
  //  int userId;
  //int id;
  String title;
  String body;

  Post({
    //  required this.userId,
    // required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        //  userId: json["userId"],
        // id: json["id"],
        title: json["title"],
        body: json["body"],
      );
}













// class Post {
//  // final int userId;
//   final String title;
//   final String description;

//  // Post({required this.userId, required this.title, required this.description});
//   Post({required this.title, required this.description});

//   factory Post.fromJson(Map<String, dynamic> json) => Post(
//         //   return Post(
//       //  userId: json['userId'],
//         title: json['title'],
//         description: json['body'],
//       );
// }

