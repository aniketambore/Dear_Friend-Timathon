import 'package:dear_friend/pages/create_post.dart';
import 'package:dear_friend/pages/timeline.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const length = 2;
  final pageIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: FractionalOffset.bottomCenter,
        children: [
          PageView.builder(
            onPageChanged: (index) => pageIndexNotifier.value = index,
            itemCount: length,
            itemBuilder: (context, index) {
              return index == 0 ? Timeline() : CreatePost();
            },
          ),
          _buildIndicator()
        ],
      ),
    );
  }

  PageViewIndicator _buildIndicator() {
    return PageViewIndicator(
        pageIndexNotifier: pageIndexNotifier,
        length: length,
        normalBuilder: (animationController, index) => ScaleTransition(
              scale: CurvedAnimation(
                parent: animationController,
                curve: Curves.ease,
              ),
//              child: Icon(
//                Icons.favorite,
//                color: Colors.white,
//              ),
              child: Image.network(
                "https://media4.giphy.com/media/xUOxf7gg8AztZMfyMM/giphy.gif",
                width: 40,
                color: Colors.grey,
              ),
            ),
        highlightedBuilder: (animationController, index) => ScaleTransition(
              scale: CurvedAnimation(
                  parent: animationController, curve: Curves.ease),
//              child: Icon(
//                Icons.star,
//                color: Colors.pink,
//              ),
              child: Image.network(
                  "https://media4.giphy.com/media/xUOxf7gg8AztZMfyMM/giphy.gif",
                  width: 40),
            ));
  }
}
