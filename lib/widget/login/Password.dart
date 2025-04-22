import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Static/valid.dart';
import '../../Controller/Logincontroller.dart';
import '../../static/Textformfid.dart';

class Password extends GetView<ControllerLogin> {
const Password({ super.key });

  @override
  Widget build(BuildContext context){
    return  Textformfid(
                      max: 20,
                     
                      valid: (val) {
                        return validInput(val!, 6, 20);
                      },
                      mycontroller: controller.password,
                      hint: "Password",
                      pass: controller.pass,
                      iconhide: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          controller.hidepass();
                        },
                      ),
                      icon2: Icon(
                        Icons.lock_outlined,
                        // color: Colorss.primrycolor,
                      ),
                      name: "Password",
                      type: TextInputType.visiblePassword,
                    );
  }
}