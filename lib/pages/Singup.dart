import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Controller/ControllerSingup.dart';

import 'package:project/widget/Singup/bottunsibgup.dart';
import 'package:project/widget/Singup/gender.dart';
import 'package:project/widget/login/backgroungstack.dart';

import '../widget/Singup/Birthday.dart';
import '../widget/Singup/emailsingup.dart';
import '../widget/Singup/password.dart';
import '../widget/Singup/username.dart';

class Singup extends StatefulWidget {
  Singup({Key? key}) : super(key: key);

  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  @override
  Widget build(BuildContext context) {
  
    ControllerSingup controller = Get.put(ControllerSingup(context: context));
    return Scaffold(
        body: GetBuilder<ControllerSingup>(
      builder: (controller) => ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Backgroungstack(),

          Form(
            key: controller.formstate,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            // key: controller2.formstate,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserNameSingup(),
                  PasswordSingup(),
                  EmailSingup(),
                  Birthday(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Gender(),
                  ),
                  ButtonSingup(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}