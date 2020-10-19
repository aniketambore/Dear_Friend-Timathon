import 'package:dear_friend/models/post_insert.dart';
import 'package:dear_friend/pages/home_page.dart';
import 'package:dear_friend/pages/timeline.dart';
import 'package:dear_friend/service/post_service.dart';
import 'package:dear_friend/widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class UploadPost extends StatefulWidget {
  @override
  _UploadPostState createState() => _UploadPostState();
}

class _UploadPostState extends State<UploadPost> {
  bool isUploading = false;
  TextEditingController _favouriteCartoonController = TextEditingController();
  PostService get postService => GetIt.I<PostService>();
  final _formKey = GlobalKey<FormState>();
  String friendName;
  String yourName;
  var _value;

  DropdownButton _itemDown() => DropdownButton<String>(
        value: _value,
        items: [
          DropdownMenuItem(
            onTap: () {
              setState(() {
                _favouriteCartoonController.text = "spongebob squarepants";
              });
            },
            value: "1",
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //Icon(Icons.build),
                Image.network(
                  "https://www.animatedimages.org/data/media/1556/animated-spongebob-image-0016.gif",
                  width: 40,
                ),
                SizedBox(width: 10),
                Text(
                  "spongebob squarepants",
                ),
              ],
            ),
          ),
          DropdownMenuItem(
            onTap: () {
              setState(() {
                _favouriteCartoonController.text = "Lonney Tunnes";
              });
            },
            value: "2",
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //Icon(Icons.build),
                Image.network(
                  "https://media2.giphy.com/media/hT5kGEx7MhcyNtQWaL/giphy.gif",
                  width: 40,
                ),
                SizedBox(width: 10),
                Text(
                  "Lonney Tunnes",
                ),
              ],
            ),
          ),
        ],
        onChanged: (value) {
          setState(() {
            _value = value;
          });
        },
        isExpanded: true,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Post"),
        actions: [
          FlatButton(
            child: Text(
              "Post",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            onPressed: isUploading == true ? null : () => handleSubmit(),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            isUploading ? linearProgress() : Text(""),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            ListTile(
              leading: Icon(
                Icons.supervised_user_circle_outlined,
                color: Colors.orange,
                size: 35,
              ),
              title: Container(
                width: 250,
                child: TextFormField(
                  onSaved: (val) => friendName = val,
                  decoration: InputDecoration(
                      hintText: "What Is Your Friend Name?",
                      border: InputBorder.none),
                  validator: (val) {
                    if (val.trim().length < 3 || val.isEmpty) {
                      return "Friend Name is too short";
                    } else if (val.trim().length > 12) {
                      return "Friend Name is too long";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.supervised_user_circle_outlined,
                color: Colors.orange,
                size: 35,
              ),
              title: Container(
                width: 250,
                child: TextFormField(
                  onSaved: (val) => yourName = val,
                  decoration: InputDecoration(
                      hintText: "What Is Your Friend Name?",
                      border: InputBorder.none),
                  validator: (val) {
                    if (val.trim().length < 3 || val.isEmpty) {
                      return "Your Name is too short";
                    } else if (val.trim().length > 12) {
                      return "Your Name is too long";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.supervised_user_circle_outlined,
                color: Colors.orange,
                size: 35,
              ),
              title: Container(width: 250, child: _itemDown()),
            )
          ],
        ),
      ),
    );
  }

  handleSubmit() async {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();

      setState(() {
        isUploading = true;
      });

      print("Im the cartoon ${_favouriteCartoonController.text}");

      final post = PostInsert(
          friendName: friendName,
          favouriteCartoon: _favouriteCartoonController.text,
          myName: yourName);

      final result = await postService.createPost(post);

      final title = "Done";

      final text = result.error
          ? (result.errorMessage ?? "An error occurred")
          : "Your Post is Created";

      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text(title),
                content: Text(text),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                            ModalRoute.withName("/Home"));
                      },
                      child: Text("OK"))
                ],
              )).then((data) {
        if (result.data) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
              ModalRoute.withName("/Home"));
        }
      });
    }
  }
}
