import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Controller/ControllerSingup.dart';

import '../../static/Textformfid.dart';
import '../../static/Valid.dart';

class PasswordSingup extends GetView<ControllerSingup> {
  const PasswordSingup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Textformfid(
      max: 20,
     
      valid: (val) {
        return validInput(val!, 6, 20,);
      },
      type: TextInputType.visiblePassword,
      iconhide: IconButton(
        icon: Icon(
          Icons.remove_red_eye_outlined,
          color: Colors.grey,
        ),
        onPressed: () {
          controller.hidepass();
        },
      ),
      mycontroller: controller.password,
      hint: "Password",
      icon2: Icon(
        Icons.lock_outlined,
      ),
      name: "Password",
      pass: controller.pass,
    );
  }
}