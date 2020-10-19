import 'package:dear_friend/pages/create_post.dart';
import 'package:dear_friend/pages/home_page.dart';
import 'package:dear_friend/pages/timeline.dart';
import 'package:dear_friend/pages/upload_post.dart';
import 'package:dear_friend/service/post_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => PostService());
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => MyHomePage(),
        "/create_post": (context) => CreatePost(),
        "/upload_post": (context) => UploadPost()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.deepPurpleAccent,
          accentColor: Colors.deepOrange[200]),
    );
  }
}
