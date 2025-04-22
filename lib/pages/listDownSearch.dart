import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:project/Controller/HomeController.dart';

import '../models/tab_bar_model.dart';
import '../widget/homepage/tabView.dart';


class ListDownSearch extends GetView<HomeController> {
  const ListDownSearch ({super.key});

  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    return FadeInUp(
                    delay: const Duration(milliseconds: 700),
                    child: Container(
                      margin: EdgeInsets.only(top: size.height * 0.01),
                      width: size.width,
                      height: size.height * 0.3,
                      child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: controller.tabController,
                          children: [
                            TabViewChild(
                              list: places,
                            ),
                            //TabViewChild(list: inspiration),
                          //  TabViewChild(list: popular),
                          ]),
                    ),
                  );
  }
}