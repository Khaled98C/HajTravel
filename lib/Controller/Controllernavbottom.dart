import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Server/server.dart';
import 'package:project/pages/Singup.dart';
import 'package:project/pages/UserInfo.dart';

class Controllernavbottombar extends GetxController {
  MyServices myServices=Get.find();
  int _tabIndex = 1;
  late PageController pageController;
  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: _tabIndex);
  }

  int get tabIndex => _tabIndex;

  set tabIndex(int v) {
    _tabIndex = v;
    update();
  }
Widget profile(){
if(  myServices.sharedPref.getString("username") != null){

  return UserInfo();
}else {
  return Singup();
}

}
  List<Widget> activeIcons = [
  
    
    Icon(Icons.favorite, color: Colors.deepPurple),
    Icon(Icons.home, color: Colors.deepPurple),
     Icon(Icons.museum, color: Colors.deepPurple),
     
   
       
  ];
  List<Widget> inactiveIcons = const [
   Text("رحلة الحج"),
   Text("الصفحة الرئيسية"),
   Text("صفحة مكة"),
 // Text("معلومات الحساب")
            
   
    
  ];
  onTap(index) {
    tabIndex = index;
    pageController.jumpToPage(tabIndex);
  }

  onPageChanged(v) {
    tabIndex = v;
  }
}
