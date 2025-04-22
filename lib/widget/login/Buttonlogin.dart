import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:spring_button/spring_button.dart';


import '../../Controller/Logincontroller.dart' show ControllerLogin;
import '../../static/row.dart';

class Buttonlogin2 extends GetView<ControllerLogin>{
const Buttonlogin2({ super.key });

  @override
  Widget build(BuildContext context){   
    Timer? timer;

    return   SizedBox(
                      height: 80,
                      width: 400,
                      child: SpringButton(
                        SpringButtonType.OnlyScale,
                        row(
                          "نسجيل الدخول",
                          Color(0xffa53ff9),
                        ),
                        onTapDown: (_) {
                          controller.getdatalogin();
                        },
                        onLongPress: () => timer = Timer.periodic(
                          const Duration(milliseconds: 1),
                          (_) => (_) {},
                        ),
                        onLongPressEnd: (_) {
                          timer?.cancel();
                        },
                      ),
                    );
  }
}