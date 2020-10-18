import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget linearProgress() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: Container(
      child: LinearProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.purple),
      ),
    ),
  );
}
