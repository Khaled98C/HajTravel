import 'package:flutter/material.dart';



class AppText extends StatelessWidget {
  const AppText(
      {     Key? key,
      required this.text,
      required this.size,
      required this.color,
      required this.fontWeight});

  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: TextStyle(fontSize: size),
    );
  }
}