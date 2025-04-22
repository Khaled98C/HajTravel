import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Server/server.dart';



class HomeController extends GetxController  {
 HomeController({ required this.tic});
 MyServices myServices=Get.find();
late final TabController tabController;
late final TickerProvider tic;

@override
  void onInit() {
        tabController = TabController(length: 3,vsync:tic );
    super.onInit();
  }



}