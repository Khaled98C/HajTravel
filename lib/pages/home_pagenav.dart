import 'package:animate_do/animate_do.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Controller/Controllernavbottom.dart';
import 'package:project/pages/Singup.dart';
import 'package:project/pages/UserInfo.dart';

import 'package:project/pages/details_page.dart';
import 'package:project/pages/homeScreen.dart';
import 'package:project/pages/listDownSearch.dart';
import 'package:project/pages/makkapage.dart';
import 'package:project/pages/rehla.dart';
import 'package:project/widget/Drawer/DrawerItems.dart';

import 'package:project/widget/homepage/searchhomepage.dart';

import '../Controller/HomeController.dart';
import '../models/people_also_like_model.dart';

import '../models/tab_bar_model.dart';
import '../widget/homepage/tabView.dart';
import '../widget/homepage/toppage.dart';
import '../widget/homepage/underFinfMore.dart';
import '../widget/reuseable_text.dart';
import '../widget/reuseabale_middle_app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
    Controllernavbottombar controllernav = Get.put(Controllernavbottombar());
    var size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          //extendBody: true,
          bottomNavigationBar: GetBuilder<Controllernavbottombar>(
            builder: (controller) => CircleNavBar(
             activeIcons: controllernav.activeIcons,
              inactiveIcons: controllernav.inactiveIcons,
              color: Colors.white,
              height: 60,
              circleWidth: 60,
              activeIndex: controllernav.tabIndex,
              onTap: (index) {
                controllernav.onTap(index);
              },
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
              // cornerRadius: const BorderRadius.only(
              //   topLeft: Radius.circular(8),
              //   topRight: Radius.circular(8),
              //   bottomRight: Radius.circular(24),
              //   bottomLeft: Radius.circular(24),
              // ),
              shadowColor: Colors.deepPurple,
              elevation: 10,
            ),
          ),
          body: PageView(
           // scrollDirection: Axis.vertical,
            controller: controllernav.pageController,
            onPageChanged: (v) {
              controllernav.onPageChanged(v);
            },
            children: [
            Rehla(),
             // Container(child: HomeScreen2()),
              MakkahPage(),
              controller.myServices.sharedPref.getString("username") != null? UserInfo()
                    :Singup(),
            
            ],
          ),
        )
        //   appBar: AppBar(
        //     leading: Builder(
        //       builder: (context) {
        //         return IconButton(
        //           icon: const Icon(Icons.menu),
        //           onPressed: () {
        //             Scaffold.of(context).openDrawer();
        //           },
        //         );
        //       },
        //     ),
        //   ),
        //   drawer: Drawer(child: DrawerItems()),
        //   body: SizedBox(
        //     width: size.width,
        //     height: size.height,
        //     child: Padding(
        //       padding: padding,
        //       child: SingleChildScrollView(
        //         physics: const BouncingScrollPhysics(),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Tophomepage(),
        //             SearchHomePage(),
        //             ListDownSearch(),

        //             // FadeInUp(
        //             //   delay: const Duration(milliseconds: 800),
        //             //   child: const MiddleAppText(text: "Find More"),
        //             // ),
        //             // UnderFindMore(),
        //             FadeInUp(
        //               delay: const Duration(milliseconds: 1000),
        //               child: const MiddleAppText(text: "People Also Like"),
        //             ),
        // FadeInUp(
        //   delay: const Duration(milliseconds: 1100),
        //   child: Container(
        //     margin: EdgeInsets.only(top: size.height * 0.01),
        //     width: size.width,
        //     height: size.height * 0.68,
        //     child: ListView.builder(
        //       itemCount: peopleAlsoLikeModel.length,
        //       physics: const NeverScrollableScrollPhysics(),
        //       itemBuilder: (context, index) {
        //         PeopleAlsoLikeModel current =
        //             peopleAlsoLikeModel[index];
        //         return GestureDetector(
        //           onTap:
        //               () => Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                   builder:
        //                       (context) => DetailsPage(
        //                         personData: current,
        //                         tabData: null,
        //                         isCameFromPersonSection: true,
        //                       ),
        //                 ),
        //               ),
        //           child: Container(
        //             margin: const EdgeInsets.all(8.0),
        //             width: size.width,
        //             height: size.height * 0.15,
        //             decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(15),
        //             ),
        //             child: Row(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Hero(
        //                   tag: current.day,
        //                   child: Container(
        //                     margin: const EdgeInsets.all(8.0),
        //                     width: size.width * 0.28,
        //                     decoration: BoxDecoration(
        //                       borderRadius: BorderRadius.circular(15),
        //                       image: DecorationImage(
        //                         image: AssetImage(current.image),
        //                         fit: BoxFit.cover,
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //                 Padding(
        //                   padding: EdgeInsets.only(
        //                     left: size.width * 0.02,
        //                   ),
        //                   child: Column(
        //                     crossAxisAlignment:
        //                         CrossAxisAlignment.start,
        //                     children: [
        //                       SizedBox(height: size.height * 0.035),
        //                       AppText(
        //                         text: current.title,
        //                         size: 17,
        //                         color: Colors.black,
        //                         fontWeight: FontWeight.w400,
        //                       ),
        //                       SizedBox(height: size.height * 0.005),
        //                       AppText(
        //                         text: current.location,
        //                         size: 14,
        //                         color: Colors.black.withOpacity(0.5),
        //                         fontWeight: FontWeight.w300,
        //                       ),
        //                       Padding(
        //                         padding: EdgeInsets.only(
        //                           top: size.height * 0.015,
        //                         ),
        //                         child: AppText(
        //                           text: "${current.day} Day",
        //                           size: 14,
        //                           color: Colors.black.withOpacity(
        //                             0.5,
        //                           ),
        //                           fontWeight: FontWeight.w300,
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // ),

        );
  }
}
