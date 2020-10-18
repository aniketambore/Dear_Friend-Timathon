import 'package:flutter/cupertino.dart';

class PostInsert{
  String friendName ;
  String favouriteCartoon ;
  String myName ;

  PostInsert({@required this.friendName , @required this.favouriteCartoon , @required this.myName}) ;

  Map<String,dynamic> toJson(){
    return {
      "friend_name" : friendName ,
      "favourite_cartoon" : favouriteCartoon ,
      "your_name" : myName
    };
  }
}