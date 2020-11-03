import 'package:dear_friend/pages/create_post.dart';
import 'package:dear_friend/pages/home_page.dart';
import 'package:dear_friend/pages/timeline.dart';
import 'package:dear_friend/pages/upload_post.dart';
import 'package:dear_friend/service/post_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';

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
          "/create_post": (context) => CreatePost(),
          "/upload_post": (context) => UploadPost()
        },
        title: 'Dear Friend',
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.tealAccent,
            accentColor: Colors.teal),
        home: _splash(context)
        //MyHomePage(),
        );
  }

  Widget _splash(context) {
    return SplashScreen(
        seconds: 5,
        navigateAfterSeconds: MyHomePage(),
        title: Text("Dear Friend",
            style: GoogleFonts.yatraOne(
              textStyle: TextStyle(
                color: Colors.tealAccent,
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            )),
        backgroundColor: Colors.black54,
        styleTextUnderTheLoader: new TextStyle(),
        loaderColor: Colors.tealAccent);
  }
}
