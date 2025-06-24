import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Controller/HomeController.dart';
import 'package:project/pages/SettingsPage.dart';


import '../../pages/Singup.dart';
import '../../pages/SupportPage.dart';
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
                        "1".tr,
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
                          Text("2".tr, style: TextStyle(fontSize: 15)),
                    ),
                  ),
                ],
              ),
        Divider(),
        ListTile(
          leading: Icon(Icons.travel_explore),
          title: Text("3".tr),
          onTap: () {
            Navigator.pop(context); // لإغلاق الدروار أولاً
            Get.to(() => BookedTripsPage()); // التنقل
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.support_agent),
          title: Text("4".tr),
          onTap: () {
            Navigator.pop(context); // لإغلاق الدروار أولاً
            Get.to(() => SupportPage()); // التنقل
          },
        ),
        Divider(),
          ListTile(
          leading: Icon(Icons.settings),
          title: Text("5".tr),
          onTap: () {
            Navigator.pop(context); // لإغلاق الدروار أولاً
            Get.to(() => SettingsPage()); // التنقل
          },
        ),
      ],
    );
  }
}
