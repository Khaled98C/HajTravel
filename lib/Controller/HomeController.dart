import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Server/server.dart';

import '../models/AzkarModel.dart';

class HomeController extends GetxController {
  HomeController({required this.tic});
  Timer? azkarTimer;

  MyServices myServices = Get.find();
  late final TabController tabController;
  late final TickerProvider tic;
// داخل الكلاس HomeController
  String todayAzkar = "اللهم ارزقنا زيارة بيتك الحرام كل عام 🕋";

  List<String> azkarList = [
    "اللهم اجعل حجنا مبرورًا وذنبنا مغفورًا 🌙",
    "اللهم ارزقنا زيارة بيتك الحرام كل عام 🕋",
    "لا إله إلا الله وحده لا شريك له، له الملك وله الحمد 🌟",
    "رب اغفر لي ولوالدي، وارحمهما كما ربياني صغيرا 💛",
    "اللهم تقبل منا صالح الأعمال واجعلنا من العائدين 💫",
  ];
  List<String> healthTips = [
    "اشرب كمية كافية من الماء لتجنب الجفاف. 💧",
    "استخدم مظلة أو قبعة للحماية من الشمس. 🧢",
    "ارتدِ أحذية مريحة أثناء الطواف والسعي. 👟",
    "تجنب الزحام عند الشعور بالتعب. 🧘‍♂️",
    "احرص على الراحة والنوم الكافي. 😴",
  ];

  String dailyHealthTip = "";

  void setDailyHealthTip() {
    final index = DateTime.now().second % healthTips.length;
    dailyHealthTip = healthTips[index];
    print("dialy healty is: $dailyHealthTip");
        print("*******************");
    update();
  }

  void setDailyAzkar() {
    final minute = DateTime.now().second % azkarList.length;
    todayAzkar = azkarList[minute];

    print(todayAzkar);
    print(minute);
    update(); // هذا مهم جدًا لتحديث GetBuilder
  }

void starthealty() {
    setDailyHealthTip(); // أول مرة
    azkarTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      setDailyHealthTip();
    });
  }
  void startAzkarTimer() {
    setDailyAzkar(); // أول مرة
    azkarTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      setDailyAzkar();
    });
  }

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: tic);
    startAzkarTimer();
    starthealty();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    azkarTimer?.cancel();
  }
}
