import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project/pages/PlacesPage.dart';

import 'package:project/pages/listDownSearch.dart';
import 'package:project/pages/makkapage.dart';
import 'package:project/pages/rehla.dart';
import 'package:project/widget/Drawer/DrawerItems.dart';
import 'package:project/widget/homepage/Azkar.dart';
import 'package:project/widget/homepage/Dlilk.dart';
import 'package:project/widget/homepage/descrption.dart';
import 'package:project/widget/homepage/healty.dart';
import '../widget/homepage/searchhomepage.dart';
import '../Controller/HomeController.dart';
import 'package:project/widget/homepage/toppage.dart';
import '../widget/reuseabale_middle_app_text.dart';

class HomepageMain extends StatefulWidget {
  const HomepageMain({super.key});

  @override
  State<HomepageMain> createState() => _HomepageMainState();
}

class _HomepageMainState extends State<HomepageMain>
    with TickerProviderStateMixin {
  final EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
    horizontal: 10.0,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController(tic: this));
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: Drawer(child: DrawerItems()),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: padding,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchHomePage(),
                  Tophomepage(),
                  Descrption(),
                  ListDownSearch(),
                  FadeInUp(
                    delay: const Duration(milliseconds: 1000),
                    child:  MiddleAppText(text: "14".tr),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///خدمات
                        Dlilk(
                          onTap: () {
                            Get.to(PlacesPage());
                          },
                          title: "15".tr,
                        ),

                        ///خلصت الخدمات

                        ///مناسك
                        Dlilk(
                          onTap: () {
                            Get.to(Rehla());
                          },
                          title: '16'.tr,
                        ),
                        Dlilk(
                          onTap: () {
                            Get.to(MakkahPage());
                          },
                          title: '17'.tr,
                        )
                      ],
                    ),
                  ),
                  FadeIn(
                    delay: const Duration(milliseconds: 1000),
                    child:  Text('18'.tr,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const SizedBox(height: 10),
                  FadeIn(
                    child: AzkarToday(),
                    delay: const Duration(milliseconds: 1000),
                  ),
                  FadeIn(
                    delay: const Duration(milliseconds: 1000),
                    child:  Text("19".tr,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  FadeIn(
                    child: Healty(),
                    delay: const Duration(milliseconds: 1000),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
