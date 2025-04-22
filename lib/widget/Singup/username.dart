import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/ControllerSingup.dart';
import '../../static/Textformfid.dart';
import '../../static/Valid.dart';

class UserNameSingup extends GetView<ControllerSingup> {
const UserNameSingup({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Textformfid(
                      max: 20,
                   
                      valid: (val) {
                        return validInput(val!, 4, 20);
                      },
                      type: TextInputType.name,
                      hint: "username",
                      icon2: Icon(
                        Icons.person,
                      ),
                      name: "Username",
                      pass: false,
                      mycontroller: controller.username);
  }
}