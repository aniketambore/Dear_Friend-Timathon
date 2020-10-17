import 'package:dear_friend/models/api_response.dart';
import 'package:dear_friend/models/cartoon_url.dart';
import 'package:dear_friend/models/post_data.dart';
import 'package:dear_friend/service/post_service.dart';
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:get_it/get_it.dart';
import 'package:dear_friend/models/api_response.dart';

class FoldingCell extends StatefulWidget {
  @override
  _FoldingCellState createState() => _FoldingCellState();
}

class _FoldingCellState extends State<FoldingCell> {
  PostService get service => GetIt.I<PostService>();
  APIResponse<List<PostForListing>> _apiResponse;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchNotes();
  }

  _fetchNotes() async {
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
    return Container(
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _apiResponse.data.length,
              itemBuilder: (context, index) {
                return SimpleFoldingCell.create(
                  frontWidget: _buildFrontWidget(index),
                  innerWidget: _buildInnerWidget(index),
                  cellSize: Size(MediaQuery.of(context).size.width, 125),
                  padding: EdgeInsets.all(15),
                  animationDuration: Duration(milliseconds: 300),
                  borderRadius: 10,
                  onOpen: () => print("$index cell opened"),
                  onClose: () => print("$index cell closed"),
                );
              }),
    );
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
          Image.asset(
            "assets/images/cell_bg.gif",
            fit: BoxFit.cover,
          ),
          Container(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    // "CARD - $index",
                    "Dear ${_apiResponse.data[index].friendName}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
          )
        ],
      );
    });
  }

  Widget _buildInnerWidget(int index) {
    return Builder(builder: (BuildContext context) {
      return Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/cell_bg.gif",
            fit: BoxFit.cover,
          ),
          Container(
            //color: Colors.black.withOpacity(0.8),
            padding: EdgeInsets.only(top: 20),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    //"CARD TITLE - $index",
                    "Dear ${_apiResponse.data[index].friendName}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image(
                        image: NetworkImage(
                            "${getCartoon[_apiResponse.data[index].cartoonName][0]}"
                            //"https://thumbs.gfycat.com/InferiorShimmeringGoldfish-max-1mb.gif"
                            ),
                      ),
                      Expanded(
                        child: Center(child: Text(
                            //"Simpson is mw bro, Simpson is mw bro,",
                            //"${posts[index].friendshipQuotes}"
                            "${getCartoon[_apiResponse.data[index].cartoonName][1]}")),
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
