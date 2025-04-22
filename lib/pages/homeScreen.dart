import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:project/pages/listDownSearch.dart';
import 'package:project/pages/rehla.dart';
import 'package:project/widget/Drawer/DrawerItems.dart';

import 'package:project/widget/homepage/searchhomepage.dart';

import '../Controller/HomeController.dart';

import '../widget/homepage/toppage.dart';

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
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Tophomepage(),
                  SearchHomePage(),
                  ListDownSearch(),

                  // FadeInUp(
                  //   delay: const Duration(milliseconds: 800),
                  //   child: const MiddleAppText(text: "Find More"),
                  // ),
                  // UnderFindMore(),
                  FadeInUp(
                    delay: const Duration(milliseconds: 1000),
                    child: const MiddleAppText(text: "People Also Like"),
                  ),
                  Container(
                    height: size.height * 0.12,
                    width: size.width * 0.35,
                    child: FadeInUp(
                        child: InkWell(
                      onTap: () {
                        Get.to(Rehla());
                      },
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.black.withOpacity(0.1),
                            child: SvgPicture.asset(
                              "images/mnask.svg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            top: size.height * 0.05,
                            left: size.height * 0.03,
                            child: Container(
                              width: double.maxFinite,
                              child: Text(
                                "مناسك الحج",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    backgroundColor: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                  )
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
