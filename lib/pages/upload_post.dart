import 'package:dear_friend/models/post_insert.dart';
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
  TextEditingController _friendNameController = TextEditingController();
  TextEditingController _myNameController = TextEditingController();
  TextEditingController _favouriteCartoonController = TextEditingController();
  PostService get postService => GetIt.I<PostService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Post"),
        actions: [
          FlatButton(
            child: Text(
              "Post",
              style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            onPressed: isUploading == true ? null : () => handleSubmit(),
          ),
        ],
      ),
      body: ListView(
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
              child: TextField(
                controller: _friendNameController,
                decoration: InputDecoration(
                    hintText: "What Is Your Friend Name?",
                    border: InputBorder.none),
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
              child: TextField(
                controller: _myNameController,
                decoration: InputDecoration(
                    hintText: "What Is Your Name?", border: InputBorder.none),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.face_unlock_outlined,
              color: Colors.orange,
              size: 35,
            ),
            title: Container(
              width: 250,
              child: TextField(
                controller: _favouriteCartoonController,
                decoration: InputDecoration(
                    hintText: "What Is Your Friend Favourite Cartoon?",
                    border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  handleSubmit() async {
    setState(() {
      isUploading = true;
    });

    final post = PostInsert(
        friendName: _friendNameController.text,
        favouriteCartoon: _favouriteCartoonController.text,
        myName: _myNameController.text);

    final result = await postService.createPost(post);

    final title = "Done";

    final text = result.error
        ? (result.errorMessage ?? "An erro occurred")
        : "Your Post is Created";

    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: Text(text),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK"))
              ],
            )).then((data) {
      if (result.data) {
        Navigator.of(context).pop();
      }
    });
  }
}
