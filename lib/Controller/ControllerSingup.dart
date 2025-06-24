import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project/Server/enumstatusrequest.dart';
import 'package:project/models/User.dart';
import 'package:project/pages/home_pagenav.dart';

import '../Server/server.dart';
import '../pages/homeScreen.dart';

class ControllerSingup extends GetxController {
  ControllerSingup({required this.context});
  MyServices myServices = Get.find();
  String? currentUsername; // يتم تحديده عند تسجيل الدخول

  late GlobalKey<FormState> formstate;
  late StatusRequest statusRequest;
  late TextEditingController username;
  late TextEditingController password;
  late TextEditingController email;
  late TextEditingController birthday;

  late BuildContext context;
  checktime() async {
    dateTime =
        (await showDatePicker(
          initialDatePickerMode: DatePickerMode.year,
          confirmText: "Save",
          cancelText: "Cancel",
          builder:
              (context, child) => Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                    primary: Color(0xff6a448d), // <-- SEE HERE
                    onPrimary: Colors.white, // <-- SEE HERE
                    onSurface: Colors.black, // <-- SEE HERE
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      // ignore: deprecated_member_use
                      foregroundColor: Color(0xff6a448d), // button text color
                    ),
                  ),
                ),
                child: child!,
              ),
          context: context,
          initialDate: dateTime,
          firstDate: DateTime(1950),
          lastDate: DateTime(2100),
        ))!;
    birthday.text = dateTime.toString(); // ✅ هذا هو الحل

    print(dateTime);
    update();
  }

  late DateTime dateTime;
  bool pass = true;

  var selectedValue = 'Male';
  String selectcountry='Syrian';
    final List<String> countryItems = ['Syrian', 'Egyptian','Lebanese','Jordanian'];
  final List<String> genderItems = ['Male', 'Female'];
  adduser() async {
    if (formstate.currentState!.validate()) {
      User newUser = User(
        currentUsername: username.text,
        password: password.text,
        gender: selectedValue,
        email: email.text,
        birthday: dateTime.toString(),
      );

      addUserToPrefs(newUser);
      userList.add(newUser);

      // userList.add(User(username: username.text,
      //     password: password.text,
      //     birthday: dateTime.toString(),
      //     email: email.text,
      //     gender: selectedValue,));

      print("user name is : ${username.text} \n ");
      print("user name is : ${email.text} \n ");
      print("barthday name is : ${birthday.text} \n ");
      print("sucsses add new user");
      myServices.sharedPref.remove("current_user");
      myServices.sharedPref.remove("email");
      myServices.sharedPref.remove("gender");
      myServices.sharedPref.remove("birthday");
      update();
      print("clean shardpref");
      
      myServices.sharedPref.setString("current_user", username.text);
      myServices.sharedPref.setString("gender", selectedValue);
      myServices.sharedPref.setString("email", email.text);
      myServices.sharedPref.setString("birthday", birthday.toString());
      myServices.sharedPref.setString("country",selectcountry);
      successlogin();
      await Future.delayed(Duration(seconds: 2));

      Get.to(HomepageMain());

      username.clear();
      password.clear();

      email.clear();
      birthday.clear();
      update();
    }
  }

  RxList<User> userList = <User>[].obs;

  faildlogin() {
    Get.snackbar(
      " ",
      " ",
      forwardAnimationCurve: Curves.easeInOutExpo,
      margin: EdgeInsets.all(20),
      borderRadius: 20,
      backgroundColor: Colors.amber,
      backgroundGradient: LinearGradient(
        colors: [Color.fromARGB(0, 236, 220, 237), Color(0xFFC385C7)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 3,
          spreadRadius: 3,
          offset: Offset(10, 10),
        ),
      ],
      // icon: Lottie.asset("lot/false.json"),
      duration: Duration(seconds: 5),
      messageText: Text(
        "هذا الحساب موجود مسبقا",
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }

  successlogin() {
    Get.snackbar(
      " ",
      " ",
      forwardAnimationCurve: Curves.easeInOutExpo,
      margin: EdgeInsets.all(20),
      borderRadius: 20,
      backgroundColor: Colors.amber,
      backgroundGradient: LinearGradient(
        colors: [
          Color.fromARGB(0, 236, 220, 237),
          Color(0xFFC385C7),
          //  Colors.white54
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 3,
          spreadRadius: 3,
          offset: Offset(10, 10),
        ),
      ],
      //icon: Lottie.asset("lot/t.json"),
      duration: Duration(seconds: 3),
      messageText: Text(
        "32".tr,
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }

  @override
  void onInit() {
    dateTime = DateTime.now();

    username = TextEditingController();
    password = TextEditingController();
    email = TextEditingController();
    birthday = TextEditingController();
    formstate = GlobalKey<FormState>();

    loadUsersFromPrefs();
    loadUsers();
    super.onInit();
  }

  hidepass() {
    if (pass == true) {
      pass = false;
    } else {
      pass = true;
    }
    update();
  }

  ////. دالة حفظ مستخدم واحد فقط
  Future<void> addUserToPrefs(User newUser) async {
    // تحميل المستخدمين المحفوظين (إن وجدوا)
    List<String> existingUsersJson =
        myServices.sharedPref.getStringList('users') ?? [];

    // تحويل المستخدم الجديد إلى JSON
    String newUserJson = jsonEncode(newUser.toJson());

    // إضافة المستخدم الجديد إلى القائمة
    existingUsersJson.add(newUserJson);

    // حفظ القائمة المحدّثة
    await myServices.sharedPref.setStringList('users', existingUsersJson);
  }
  ////// انتهت . دالة حفظ مستخدم واحد فقط
  ///////✅ 3. دالة تحميل جميع المستخدمين لاحقًا:

  Future<List<User>> loadUsersFromPrefs() async {
    List<String>? jsonList = myServices.sharedPref.getStringList('users');

    if (jsonList != null) {
      return jsonList
          .map(
            (jsonString) =>
                User.fromJson(jsonDecode(jsonString) as Map<String, dynamic>),
          )
          .toList();
    } else {
      return [];
    }
  }

  void loadUsers() async {
    List<User> loadedUsers = await loadUsersFromPrefs();
    userList.assignAll(loadedUsers); // ✅ لتحديث Obx تلقائيًا
  }

  void printAllUsers() async {
    List<User> users = await loadUsersFromPrefs();

    for (var user in users) {
      print("اسم المستخدم: ${user.currentUsername}");
      print("البريد الإلكتروني: ${user.email}");
      print("الجنس: ${user.gender}");
      print("تاريخ الميلاد: ${user.birthday}");
      print("كلمة المرور: ${user.password}");
      print("----------------------");
    }
  }

  ///بحث حسب الاسم
  Future<User?> findUserByUsername(String usernameToFind) async {
    List<User> users = await loadUsersFromPrefs();

    try {
      return users.firstWhere((user) => user.currentUsername == usernameToFind);
    } catch (e) {
      return null; // لم يتم العثور على المستخدم
    }
  }

  //الاستخدام
  void searchExample() async {
    User? user = await findUserByUsername("ahmad");
    if (user != null) {
      print("تم العثور على المستخدم: ${user.email}");
    } else {
      print("لم يتم العثور على المستخدم");
    }
  }

  ///✅ البحث باستخدام أكثر من شرط (مثل تسجيل الدخول)
  Future<User?> login(String username, String password) async {
    List<User> users = await loadUsersFromPrefs();

    try {
      return users.firstWhere(
        (user) => user.currentUsername == username && user.password == password,
      );
    } catch (e) {
      return null;
    }
  }
}
