import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Server/server.dart';
import 'package:project/pages/homeScreen.dart';
import 'package:project/pages/home_pagenav.dart';
class ControllerUserInfo extends GetxController {
  MyServices myServices = Get.find();

  String username = "غير معروف";
  String email = "غير متوفر";
  String gender = "غير محدد";
  String birthday = "";
  String age = "غير محسوب";

  @override
  void onInit() {
    _loadUserData();
    super.onInit();
  }

  void _loadUserData() {
    username = myServices.sharedPref.getString("current_user") ?? "غير معروف";
    email = myServices.sharedPref.getString("email") ?? "غير متوفر";
    gender = myServices.sharedPref.getString("gender") ?? "غير محدد";
    birthday = myServices.sharedPref.getString("birthday") ?? "";

    debugPrint("🟢 username: $username");
    debugPrint("🟢 email: $email");
    debugPrint("🟢 gender: $gender");
    debugPrint("🟢 birthday: $birthday");

    try {
      if (birthday.trim().isNotEmpty) {
        DateTime birthDate = DateTime.parse(birthday);
        age = _calcAgeFromBirthday(birthDate);
      } else {
        age = "غير محدد";
      }
    } catch (e) {
      debugPrint("❌ خطأ في تحويل تاريخ الميلاد: $e");
      age = "غير صالح";
    }

    update(); // لتحديث GetBuilder
  }

  String _calcAgeFromBirthday(DateTime birthDate) {
    final now = DateTime.now();
    int calculatedAge = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      calculatedAge--;
    }
    return "$calculatedAge سنة";
  }

  void logout() async {
    await myServices.sharedPref.clear(); // 🔥 حذف كل شيء

    username = "غير معروف";
    email = "غير متوفر";
    gender = "غير محدد";
    birthday = "";
    age = "غير محسوب";

    update();

    Get.offAll(() => HomepageMain(), transition: Transition.circularReveal);
  }
}




/*
class ControllerUserInfo extends GetxController{
  MyServices myServices=Get.find();
   late DateTime agebirthday;
  late DateTime currentDate;
  String? age;
 late String? username=myServices.sharedPref.getString("username");
 late String? email=myServices.sharedPref.getString("email");
 late String? gender=myServices.sharedPref.getString("gender");
 late String? birthday=myServices.sharedPref.getString("birthday");
 getalldatauser(){
   late String? username=myServices.sharedPref.getString("username");
 late String? email=myServices.sharedPref.getString("email");
 late String? gender=myServices.sharedPref.getString("gender");
 late String? birthday=myServices.sharedPref.getString("birthday");
 }
@override
  void onInit() {

     if (birthday != null) {
    agebirthday = DateTime.parse(birthday!);
    currentDate = DateTime.now();
    age = calcage();
  } else {
    age = "0"; // أو أي قيمة افتراضية
    print("تحذير: تاريخ الميلاد غير موجود في SharedPreferences");
  }getalldatauser();

    super.onInit();
  
  }

logout(){
  myServices.sharedPref.remove("username");
  myServices.sharedPref.remove("email");
  myServices.sharedPref.remove("gender");
  myServices.sharedPref.remove("birthday");
  print("Done clear data user.. ");
  Get.to(HomePage(),transition: Transition.circularReveal);
  update();
}
 

 
  String calcage() {
    String age = (currentDate.year - agebirthday.year).toString();
    return age;
  }




}*/