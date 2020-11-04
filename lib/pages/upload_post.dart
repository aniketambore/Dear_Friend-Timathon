import 'package:dear_friend/models/post_insert.dart';
import 'package:dear_friend/pages/home_page.dart';
import 'package:dear_friend/pages/timeline.dart';
import 'package:dear_friend/service/post_service.dart';
import 'package:dear_friend/util/colors.dart';
import 'package:dear_friend/widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

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

  DropdownButtonHideUnderline _itemDown() => DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _value,
          hint: Text("Select Your Favourite Cartoon"),
          items: [
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "Tom And Jerry";
                });
              },
              value: "1",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/Rh5bBng/tom-and-jerry.gif",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Tom And Jerry",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "Lonney Tunes";
                });
              },
              value: "2",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/Yy30S7p/loony-tunes.gif",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Lonney Tunes",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "Scooby Doo";
                });
              },
              value: "3",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/v3Yc6SJ/scooby-doo.gif",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Scooby Doo",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "Sponge Bob";
                });
              },
              value: "4",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/JscNd8N/sponge-bob.gif",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Sponge Bob",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "Avatar";
                });
              },
              value: "5",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/VQzYT5K/avatar.gif",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Avatar",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "The Simpsons";
                });
              },
              value: "6",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/VjCPNSx/simpsons.gif",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "The Simpsons",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "Phineas And Ferb";
                });
              },
              value: "7",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/jWWnD1x/phineas6.gif",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Phineas And Ferb",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "Teen Titans";
                });
              },
              value: "8",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/LRY2GJ2/teen-titans.gif",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Teen Titans",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "The Bugs Bunny Show";
                });
              },
              value: "9",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/Drcrhxm/bunny.gif",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "The Bugs Bunny Show",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "Rick And Morty";
                });
              },
              value: "10",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/Z2B5z8w/rick.gif",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Rick And Morty",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "Gravity Falls";
                });
              },
              value: "11",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/tJFxFzp/gravity.gif",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Gravity Falls",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "DuckyTales";
                });
              },
              value: "12",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/JK3PLZ9/ducky.png",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "DuckyTales",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "Pokémon";
                });
              },
              value: "13",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/QKRDdTN/pokemon.gif",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Pokémon",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "The Pink Panther";
                });
              },
              value: "14",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/4SVgzxk/pinkpanther.gif",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "The Pink Panther",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "Adventure Time";
                });
              },
              value: "15",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/vJ9XPNw/adventure.gif",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Adventure Time",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "Popeye The Sailor";
                });
              },
              value: "16",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/7bGyVnS/popeye.gif",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Popeye The Sailor",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "The Powerpuff Girls";
                });
              },
              value: "17",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/GdTXp69/powerpuff.gif",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "The Powerpuff Girls",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "Spiderman";
                });
              },
              value: "18",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/dJ5YYfF/spiderman.gif",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Spiderman",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "Dragon Ball Z";
                });
              },
              value: "19",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/bQmNHKr/drangonball.gif",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Dragon Ball Z",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "Ben10";
                });
              },
              value: "20",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/KFZMTt7/ben10.gif",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Ben10",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "The Smurfs";
                });
              },
              value: "21",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/QPCJVvJ/smurfs.gif",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "The Smurfs",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "Doremon";
                });
              },
              value: "22",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/qsJLC0x/doremon.gif",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Doremon",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "Bob The Builder";
                });
              },
              value: "23",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/XJ8M0HK/bob-builder.gif",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Bob The Builder",
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              onTap: () {
                setState(() {
                  _favouriteCartoonController.text = "Mr Bean";
                });
              },
              value: "24",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.build),
                  Image.network(
                    "https://i.ibb.co/ws2QcQ0/mrbean.png",
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Mr Bean",
                    style: TextStyle(color: Colors.tealAccent),
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
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: appBarDark,
        title: Text("Upload Post",
            style: GoogleFonts.yatraOne(
              textStyle: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.tealAccent),
            )),
        actions: [
          FlatButton(
            child: Text(
              "Post",
              style: GoogleFonts.actor(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.lightGreenAccent)),
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
              leading: Image.network(
                "https://i.ibb.co/v3Yc6SJ/scooby-doo.gif",
                width: 80,
              ),
//              Icon(
//                Icons.supervised_user_circle_outlined,
//                color: Colors.orange,
//                size: 35,
//              ),
              title: Container(
                width: 250,
                child: TextFormField(
                  onSaved: (val) => friendName = val,
                  cursorColor: Colors.lightGreenAccent,
                  decoration: InputDecoration(
                      hintText: "What Is Your Friend Name?",
                      focusColor: Colors.orange,
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
              leading: Image.network(
                "https://i.ibb.co/ws2QcQ0/mrbean.png",
                width: 80,
              ),
//              Icon(
//                Icons.supervised_user_circle_outlined,
//                color: Colors.orange,
//                size: 35,
//              ),
              title: Container(
                width: 250,
                child: TextFormField(
                  cursorColor: Colors.lightGreenAccent,
                  onSaved: (val) => yourName = val,
                  decoration: InputDecoration(
                      hintText: "What Is Your Name?", border: InputBorder.none),
                  validator: (val) {
                    if (val.trim().length < 2 || val.isEmpty) {
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
              leading: Image.network(
                "https://www.freepngimg.com/thumb/cartoon/7-2-cartoon-picture.png",
                width: 80,
              ),
//              Icon(
//                Icons.supervised_user_circle_outlined,
//                color: Colors.orange,
//                size: 35,
//              ),
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
          favouriteCartoon: _favouriteCartoonController.text == ""
              ? "Scooby Doo"
              : _favouriteCartoonController.text,
          myName: yourName);

      final result = await postService.createPost(post);

      final title = "Done";

      final text = result.error
          ? (result.errorMessage ?? "An error occurred")
          : "Your Post is Created";

      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Center(
                  child: Text(
                    title,
                    style: GoogleFonts.yatraOne(
                        textStyle: TextStyle(color: Colors.tealAccent)),
                  ),
                ),
                content: Text(
                  text,
                  style: GoogleFonts.aclonica(
                      textStyle: TextStyle(color: Colors.lightGreenAccent)),
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                            ModalRoute.withName("/Home"));
                      },
                      child: Text("OK",
                          style: GoogleFonts.aclonica(
                              textStyle:
                                  TextStyle(color: Colors.lightGreenAccent))))
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
