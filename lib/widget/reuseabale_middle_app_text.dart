import 'package:flutter/material.dart';

import 'reuseable_text.dart';

class MiddleAppText extends StatelessWidget {
  const MiddleAppText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:   [
          AppText(
            text: text,
            size: 19,
           
            fontWeight: FontWeight.w500,
          ),
         
        ],
      ),
    );
  }
}