
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Server/server.dart';

class OnpordMidelware extends GetMiddleware {
  MyServices myServices= Get.find();
@override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPref.getString("skip") != null) {
      return RouteSettings(name:"/homepage");
    }
    return null;

        
 
  } 
  


}