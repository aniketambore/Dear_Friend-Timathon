import 'package:dear_friend/pages/upload_post.dart';
import 'package:dear_friend/widgets/progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Post"),
        centerTitle: true,
      ),
      body: splashPostScreen(),
    );
  }

  Widget splashPostScreen() {
    return Stack(
      fit: StackFit.expand,
      children: [
//        Opacity(
//          opacity: 0.8,
//          child: Image.network(
//            //"assets/images/Background2.jpg",
//            "https://i.pinimg.com/originals/30/52/13/3052136d9b22f4bb60d8457821d81290.gif",
//            fit: BoxFit.cover,
//          ),
//        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Want To Create Post ?",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                    "Create Post",
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                  color: Colors.deepOrange,
                  onPressed: () => selectPost(context),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  selectPost(parentContext) {
    return showDialog(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
            title: Text("Create Your Dear Friend Post ?"),
            children: [
//              SimpleDialogOption(
//                child: Image.network(
//                    "https://thumbs.gfycat.com/RecklessEagerGraysquirrel-max-1mb.gif"),
//              ),
              SimpleDialogOption(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                      color: Colors.deepOrange,
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cancel")),
                  FlatButton(
                      color: Colors.deepOrange,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UploadPost()));
                      },
                      child: Text("Let's Go!")),
                ],
              )),
            ],
          );
        });
  }
}
