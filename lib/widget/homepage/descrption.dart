import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Descrption extends StatelessWidget {
  const Descrption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "12".tr,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
             
            ),
          ),
          TextSpan(
            text: "13".tr,
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
            
            ),
          ),
        ],
      ),
      textAlign: TextAlign.start,
    );
  }
}
