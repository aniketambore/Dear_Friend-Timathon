import 'package:dear_friend/pages/create_post.dart';
import 'package:dear_friend/pages/timeline.dart';
import 'package:dear_friend/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.animateToPage(pageIndex,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [Timeline(), CreatePost()],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: onTap,
        activeColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.grinStars)),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.solidStar)),
        ],
      ),
    );
  }
}

//class MyHomePage extends StatefulWidget {
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  static const length = 2;
//  final pageIndexNotifier = ValueNotifier<int>(0);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Stack(
//        alignment: FractionalOffset.bottomCenter,
//        children: [
//          PageView.builder(
//            onPageChanged: (index) => pageIndexNotifier.value = index,
//            itemCount: length,
//            itemBuilder: (context, index) {
//              return index == 0 ? Timeline() : CreatePost();
//            },
//          ),
//          _buildIndicator()
//        ],
//      ),
//    );
//  }
//
//  PageViewIndicator _buildIndicator() {
//    return PageViewIndicator(
//        pageIndexNotifier: pageIndexNotifier,
//        length: length,
//        normalBuilder: (animationController, index) => ScaleTransition(
//              scale: CurvedAnimation(
//                parent: animationController,
//                curve: Curves.ease,
//              ),
//              child: Icon(
//                FontAwesomeIcons.solidStar,
//                color: Colors.tealAccent,
//              ),
//            ),
//        highlightedBuilder: (animationController, index) => ScaleTransition(
//              scale: CurvedAnimation(
//                  parent: animationController, curve: Curves.ease),
//              child: Icon(
//                FontAwesomeIcons.grinStars,
//                color: Colors.tealAccent,
//              ),
//            ));
//  }
//}
