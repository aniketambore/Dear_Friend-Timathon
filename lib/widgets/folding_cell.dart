import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dear_friend/models/api_response.dart';
import 'package:dear_friend/models/cartoon_url.dart';
import 'package:dear_friend/models/post_data.dart';
import 'package:dear_friend/service/post_service.dart';
import 'package:dear_friend/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:get_it/get_it.dart';
import 'package:dear_friend/models/api_response.dart';
import 'package:google_fonts/google_fonts.dart';

class FoldingCell extends StatefulWidget {
  @override
  _FoldingCellState createState() => _FoldingCellState();
}

class _FoldingCellState extends State<FoldingCell> {
  PostService get service => GetIt.I<PostService>();
  APIResponse<List<PostForListing>> _apiResponse;
  bool _isLoading = false;
  var _value;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchPosts();
  }

  _fetchPosts() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getPostsList();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: _apiResponse.data.length,
            itemBuilder: (context, index) {
              return Center(
                child: SimpleFoldingCell.create(
                  frontWidget: _buildFrontWidget(index),
                  innerWidget: _buildInnerWidget(index),
                  cellSize: Size(
                      shortestSide < 600
                          ? MediaQuery.of(context).size.width
                          : MediaQuery.of(context).size.width / 2,
                      125),
                  padding: EdgeInsets.all(15),
                  animationDuration: Duration(milliseconds: 500),
                  borderRadius: 10,
                  onOpen: () => print("$index cell opened"),
                  onClose: () => print("$index cell closed"),
                ),
              );
            });
  }

  Widget _buildFrontWidget(int index) {
    return Builder(builder: (BuildContext context) {
      if (_isLoading) {
        return CircularProgressIndicator();
      }

      if (_apiResponse.error) {
        return Center(
          child: Text(_apiResponse.errorMessage),
        );
      }

      return Stack(
        fit: StackFit.expand,
        children: [
//          Image.asset(
//            "assets/images/card.jpg",
//            fit: BoxFit.cover,
//          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.black],
            )),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                      // "CARD - $index",
                      //"Dear ${_apiResponse.data[index].friendName}",
                      "Dear ${_apiResponse.data[_apiResponse.data.length - index - 1].friendName}",
                      style: GoogleFonts.laila(
                        textStyle: TextStyle(
                          color: Colors.cyanAccent,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                Positioned(
                  right: 5,
                  bottom: 0,
                  child: FlatButton(
                    onPressed: () {
                      final foldingCellState = context
                          .findAncestorStateOfType<SimpleFoldingCellState>();
                      foldingCellState?.toggleFold();
                    },
                    child: Image.asset(
                      "assets/images/Open.png",
                      width: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              right: 15,
              top: 5,
              child: Text(
                  "From: ${_apiResponse.data[_apiResponse.data.length - index - 1].yourName}",
                  style: GoogleFonts.aladin(
                    textStyle: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 15,
                        fontStyle: FontStyle.italic),
                  )))
        ],
      );
    });
  }

  Widget _buildInnerWidget(int index) {
    return Builder(builder: (BuildContext context) {
      return Stack(
        fit: StackFit.expand,
        children: [
//          Image.asset(
//            //"assets/images/colorful_bg.jpg",
//            "https://cutewallpaper.org/21/background-gif-html/15-CSS-Animated-Backgrounds-Pintire.gif",
//            fit: BoxFit.cover,
//          ),
          Container(
            color: cardBg,
            padding: EdgeInsets.only(top: 20),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                      //"CARD TITLE - $index",
                      //"Dear ${_apiResponse.data[index].friendName}",
                      "Dear ${_apiResponse.data[_apiResponse.data.length - index - 1].friendName}",
                      style: GoogleFonts.laila(
                        textStyle: TextStyle(
                          color: Colors.orange,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image(
                        image: NetworkImage(
                            //"${getCartoon[_apiResponse.data[index].cartoonName][0]}"
                            "${getCartoon[_apiResponse.data[_apiResponse.data.length - index - 1].cartoonName][0]}"
                            //"https://thumbs.gfycat.com/InferiorShimmeringGoldfish-max-1mb.gif",
                            ),
                        width: 150,
                      ),
                      Expanded(
                        child: Center(
                          child: TyperAnimatedTextKit(
                              onTap: () {
                                print("Tap Event");
                              },
                              text: [
                                "${getCartoon[_apiResponse.data[_apiResponse.data.length - index - 1].cartoonName][1]}"
                              ],
                              textStyle: GoogleFonts.bioRhyme(
                                textStyle: TextStyle(
                                    fontSize: 18.0, fontFamily: "Bobbers"),
                              ),
                              textAlign: TextAlign.start,
                              alignment: AlignmentDirectional
                                  .topStart // or Alignment.topLeft
                              ),
//                          Text(
//                            //"${posts[index].friendshipQuotes}"
//                            //"${getCartoon[_apiResponse.data[index].cartoonName][1]}"
//                            "${getCartoon[_apiResponse.data[_apiResponse.data.length - index - 1].cartoonName][1]}",
//                            style: TextStyle(color: nameColor, fontSize: 18),
//                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 1,
                  bottom: 0,
                  child: FlatButton(
                    onPressed: () {
                      final foldingCellState =
                          context.findRootAncestorStateOfType<
                              SimpleFoldingCellState>();
                      foldingCellState?.toggleFold();
                    },
                    child: Image.asset(
                      "assets/images/close.png",
                      width: 80,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      );
    });
  }
}
