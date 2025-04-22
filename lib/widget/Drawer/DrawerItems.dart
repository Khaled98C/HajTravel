import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Controller/HomeController.dart';
import 'package:project/pages/makkapage.dart';

import '../../pages/Singup.dart';
import '../../pages/UserInfo.dart';
import '../../pages/booked_trips_page.dart';
import '../../pages/rehla.dart';

class DrawerItems extends GetView<HomeController> {
  const DrawerItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        // ListTile(
        //   leading: Icon(Icons.personal_injury_rounded),
        //   subtitle: InkWell(
        //     onTap: () {
        //       Navigator.pop(context); // لإغلاق الدروار أولاً

        //       Get.to(Rehla());
        //     },
        //     child: Text("رحلة الحج", style: TextStyle(fontSize: 15)),
        //   ),
        // ),
        // Divider(),
        ListTile(
          leading: Icon(Icons.museum),
          subtitle: InkWell(
            onTap: () {
              Navigator.pop(context); // لإغلاق الدروار أولاً

              Get.to(MakkahPage());
            },
            child: Text("صفحة مكة", style: TextStyle(fontSize: 15)),
          ),
        ),
        controller.myServices.sharedPref.getString("current_user") != null
            ? Column(
                children: [
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.person),
                    subtitle: InkWell(
                      onTap: () {
                        Navigator.pop(context); // لإغلاق الدروار أولاً
                        Get.to(UserInfo());

                        //   Get.to(UserPage());
                        //  Get.to(UserProfilePage());
                      },
                      child: Text(
                        "الحساب الشخصي",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.person),
                    subtitle: InkWell(
                      onTap: () {
                        Navigator.pop(context); // لإغلاق الدروار أولاً

                        Get.to(Singup());
                      },
                      child:
                          Text("تسجيل الدخول", style: TextStyle(fontSize: 15)),
                    ),
                  ),
                ],
              ),
        Divider(),
        ListTile(
          leading: Icon(Icons.travel_explore),
          title: Text("رحلاتي"),
          onTap: () {
            Navigator.pop(context); // لإغلاق الدروار أولاً
            Get.to(() => BookedTripsPage()); // التنقل
          },
        ),
      ],
    );
  }
}
