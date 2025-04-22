import 'package:get/get.dart';
import 'package:project/pages/homeScreen.dart';
import 'package:project/pages/home_pagenav.dart';

import '../Server/server.dart';

class ControllerWelcompage extends GetxController {
  MyServices myServices = Get.find();
  goto() {
    myServices.sharedPref.setString("skip", "1");
    // ignore: avoid_print
    print("-------------------------------------");
    print("-------------------------------------");
    print("skip done");
    print("-------------------------------------");
    print("-------------------------------------");
    print("-------------------------------------");

    Get.to(HomepageMain());
    //Get   Get.to(()=>login());
  }
}
