import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/HomeController.dart';

class Healty extends GetView<HomeController> {
const Healty({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GetBuilder<HomeController>(
  builder: (_) => Card(
    margin: const EdgeInsets.all(16),
    color: Colors.green[50],
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        controller.dailyHealthTip,
        style: const TextStyle( fontSize: 16),
        textAlign: TextAlign.center,
      ),
    ),
  ),
)
;
  }
}