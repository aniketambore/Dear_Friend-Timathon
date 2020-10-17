import 'dart:convert';

import 'package:dear_friend/models/api_response.dart';
import 'package:dear_friend/models/post_data.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PostService {
  static const API = "http://10.0.2.2:1337";

  Future<APIResponse<List<PostForListing>>> getPostsList() {
    return http.get(API + "/commits").then((data){
      if(data.statusCode == 200){

        final jsonData = json.decode(data.body) ;
        final posts = <PostForListing>[] ;

        for(var item in jsonData){
          final post = PostForListing(
            friendName: item["friend_name"] ,
            cartoonName: item["favourite_cartoon"] ,
          );
          posts.add(post) ;
        }
        return APIResponse<List<PostForListing>>(data: posts) ;
      }
        return APIResponse<List<PostForListing>>(error: true ,errorMessage: "An Error Occurred :(" ) ;

    })
        .catchError((_) =>
        APIResponse<List<PostForListing>>(error: true ,errorMessage: "An Error Occurred :(" )) ;
  }

//  List<PostForListing> getPostsList() {
//    return [
//      PostForListing(
//          friendName: "Aniket",
//          cartoonUrl:
//              "https://www.animatedimages.org/data/media/1556/animated-spongebob-image-0016.gif",
//          cartoonName: "spongebob squarepants",
//          friendshipQuotes:
//              "Friendship is born at that moment when one person says to another: ‘What! You too? I thought I was the only one."),
//      PostForListing(
//          friendName: "Anushka",
//          cartoonUrl:
//              "https://thumbs.gfycat.com/InferiorShimmeringGoldfish-max-1mb.gif",
//          cartoonName: "The Simpsons",
//          friendshipQuotes:
//              "A good friend is like a four-leaf clover; hard to find and lucky to have."),
//      PostForListing(
//          friendName: "Ashok",
//          cartoonUrl:
//              "https://media2.giphy.com/media/hT5kGEx7MhcyNtQWaL/giphy.gif",
//          cartoonName: "Lonney Tunnes",
//          friendshipQuotes:
//              "The language of friendship is not words but meanings"),
//      PostForListing(
//          friendName: "Maya",
//          cartoonUrl:
//              "https://thumbs.gfycat.com/MindlessEvilIcterinewarbler-max-1mb.gif",
//          cartoonName: "South Park",
//          friendshipQuotes:
//              "There are no strangers here; Only friends you haven’t yet met."),
//      PostForListing(
//          friendName: "Pinky",
//          cartoonUrl:
//              "https://i.pinimg.com/originals/d0/80/91/d0809168a687fcd73fe865ad0abb02ff.gif",
//          cartoonName: "Gravity Falls",
//          friendshipQuotes:
//              "A real friend is one who walks in when the rest of the world walks out.")
//    ];
//  }
}
