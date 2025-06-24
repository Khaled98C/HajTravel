import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Controller/HomeController.dart';

class AzkarToday extends GetView<HomeController> {
const AzkarToday({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return    GetBuilder<HomeController>(builder: (controller) {
   return   Card(
                        color: Colors.lightBlue[50],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            controller.todayAzkar,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ));
                      
    },);
  }
}