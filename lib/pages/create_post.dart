import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dear_friend/pages/upload_post.dart';
import 'package:dear_friend/util/colors.dart';
import 'package:dear_friend/widgets/progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarDark,
        title: Text(
          "Create Post",
          style: GoogleFonts.yatraOne(
              textStyle: TextStyle(
            color: Colors.tealAccent,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          )),
        ),
        centerTitle: true,
      ),
      body: splashPostScreen(),
    );
  }

  Widget splashPostScreen() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Opacity(
          opacity: 0.7,
          child: Image.asset(
            "assets/images/space.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeAnimatedTextKit(
                  onTap: () {
                    print("Tap Event");
                  },
                  text: [
                    "Want To Create Post ?",
                    "Do It RIGHT!!",
                    "Do It RIGHT NOW!!!"
                  ],
                  textStyle:
                      TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                  alignment:
                      AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text("Create Post",
                      style: TextStyle(color: Colors.white, fontSize: 22.0)),
                  color: Colors.deepOrange,
                  onPressed: () =>
                      Navigator.of(context).pushNamed("/upload_post"),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
