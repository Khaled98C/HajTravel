import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Static/valid.dart';
import '../../Controller/Logincontroller.dart' show ControllerLogin;
import '../../static/Textformfid.dart';

class User extends GetView<ControllerLogin> {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return 
       Textformfid(
        max: 20,
        mycontroller: controller.username,
        pass: false,
        valid: (val) {
         if (GetUtils.isUsername(val!)) {}
          return validInput(val, 4, 20,);
        },
        
        hint: "Username",
        icon2: Icon(
          Icons.person,
        ),
        name: "Username",
        type: TextInputType.text,
      
    );
  }
}