import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../reuseable_text.dart';

class Tophomepage extends StatelessWidget {
  const Tophomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: FadeInUp(
            delay: const Duration(milliseconds: 300),
            child:  AppText(
              text: "11".tr,
              size: 18,
              //color: Colors.black,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ],
    );
  }
}
