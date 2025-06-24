import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  AppText(
      {Key? key,
      required this.text,
      required this.size,
      required this.fontWeight});

  final String text;
  final double size;

  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.start,
      text,
      style: TextStyle(fontSize: size),
    );
  }
}
