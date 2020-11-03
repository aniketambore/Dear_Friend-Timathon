import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dear_friend/util/colors.dart';
import 'package:dear_friend/widgets/folding_cell.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarDark,
        title: Text("Dear Friend",
            style: GoogleFonts.yatraOne(
              textStyle: TextStyle(
                color: Colors.tealAccent,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            )),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset(
              "assets/images/space.jpg",
              fit: BoxFit.cover,
            ),
          ),
          FoldingCell()
        ],
      ),
    );
  }
}
