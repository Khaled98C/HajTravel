import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/tab_bar_model.dart';
import '../../pages/details_page.dart';
import '../reuseable_text.dart';

class TabViewChild extends StatelessWidget {
  const TabViewChild({
    required this.list,
    super.key,
  });

  final List<TabBarModel> list;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: ListView.builder(
        itemCount: list.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          TabBarModel current = list[index];
          return GestureDetector(
            onTap: () {
              Get.to(DetailsPage(
               
                tabData: current,
                isCameFromPersonSection: false,
              ));
            },
            child: Container(
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Hero(
                    tag: current.image,
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      width: size.width * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(current.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: size.height * 0.2,
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      width: size.width * 0.53,
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(153, 0, 0, 0),
                            Color.fromARGB(118, 29, 29, 29),
                            Color.fromARGB(54, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Positioned(
                      left: size.width * 0.07,
                      bottom: size.height * 0.045,
                      child: AppText(
                        text: current.title,
                        size: 15,
                     
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Positioned(
                    left: size.width * 0.07,
                    bottom: size.height * 0.025,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        AppText(
                          text: current.location,
                          size: 12,
                   
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
