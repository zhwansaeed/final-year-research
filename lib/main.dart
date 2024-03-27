import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:async';

import 'package:travel_guidance/post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeWidget(),
    );
  }
}

Future<Post> getFunction() async {
  final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    return Post.fromJson(
      jsonDecode(response.body),
    );
  } else {
    throw Exception('Faild to get data');
  }
}

Future<Post> postFunction(String title, String body) async {
  Map<String, dynamic> request = {
    'title': title,
    'body': body,
  };
  final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  final response = await http.post(uri, body: request);
  if (response.statusCode == 201) {
    return Post.fromJson(
      jsonDecode(response.body),
    );
  } else {
    throw Exception('Faild to post data');
  }
}

Future<Post> updateFunction(String title, String body) async {
  Map<String, dynamic> request = {
    'title': title,
    'body': body,
  };
  final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
  final response = await http.put(uri, body: request);
  if (response.statusCode == 200) {
    return Post.fromJson(
      jsonDecode(response.body),
    );
  } else {
    throw Exception('Faild to update data');
  }
}

Future<Post?>? deleteFunction() async {
  final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
  final response = await http.delete(uri);
  if (response.statusCode == 200) {
    return null;
  } else {
    throw Exception('Faild to delete data');
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  Future<Post?>? post;

  String apiResult = "";

  void result(context, snapshot) {
    apiResult =
        'Title: ' + snapshot.data.title + '\n\nBody: ' + snapshot.data.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(
          child: Text('Flutter API'),
        ),
      ),
      body: SizedBox(
        height: 500,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.amberAccent,
              child: Center(
                  child: Text(
                apiResult,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              )),
            ),
            FutureBuilder<Post?>(
              future: post,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.none) {
                  return Container();
                } else {
                  if (snapshot.hasData) {
                    result(context, snapshot);
                    return Container();
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else {
                    return Container();
                  }
                }
              },
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    post = getFunction();
                  });
                },
                child: const Text("GET"),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      post = postFunction("title", "body");
                    });
                  },
                  child: const Text("POST")),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      post = postFunction("zhwan", "body");
                    });
                  },
                  child: const Text("UPDATE")),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      post = deleteFunction();
                    });
                  },
                  child: const Text("DELETE")),
            ),
          ],
        ),
      ),
    );
  }
}
  //Test