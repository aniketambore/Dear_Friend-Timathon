import 'package:dear_friend/widgets/folding_cell.dart';
import 'package:flutter/material.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          "Dear Friend",
          style: TextStyle(color: Colors.tealAccent),
        ),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
//          Opacity(
//            opacity: 0.7,
//            child: Image.asset(
//              "assets/images/space_bg.gif",
//              fit: BoxFit.cover,
//            ),
//          ),
          FoldingCell()
        ],
      ),
    );
  }
}
