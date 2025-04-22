
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/ControllerSingup.dart';
import '../../static/Textformfid.dart';
import '../../static/Valid.dart';

class EmailSingup extends GetView<ControllerSingup> {
const EmailSingup({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Textformfid(
                      max: 40,
                    
                      valid: (val) {
                        return validemail(val!, 12, 40);
                      },
                      type: TextInputType.emailAddress,
                      pass: false,
                      mycontroller: controller.email,
                      hint: "email",
                      icon2: Icon(
                        Icons.email,
                      ),
                      name: 'email');
  }
}