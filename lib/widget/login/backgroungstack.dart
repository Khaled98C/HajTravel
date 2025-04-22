import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Backgroungstack extends StatelessWidget {
  const Backgroungstack({super.key, });

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    return SizedBox(
      height: Get.height / 2.80,
      child: Stack(
        children: [
          Positioned(
            top: -40,
            width: width,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/one.png"), fit: BoxFit.fill)),
            ),
          ),
          Positioned(
            width: width + 30,
            left: 0,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/two.png"), fit: BoxFit.fill)),
            ),
          ),
          
        ],
      ),
    );
  }
}