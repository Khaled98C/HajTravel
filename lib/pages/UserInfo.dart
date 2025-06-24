import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Controller/controlleruserinfo.dart';
    
class UserInfo extends StatelessWidget {

   UserInfo({ Key? key }) : super(key: key);
  ControllerUserInfo controller =Get.put(ControllerUserInfo());

  @override
  Widget build(BuildContext context) {
    
   // final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("الملف الشخصي",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isWideScreen = constraints.maxWidth > 600;

          return SingleChildScrollView(
            child: Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 700),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: isWideScreen ? 60 : 40,
                      backgroundColor: Colors.deepPurple,
                      child: Image.asset("images/avatar.png")
                    ),
                    const SizedBox(height: 20),
                    GetBuilder<ControllerUserInfo>(init: ControllerUserInfo(),
                      builder: (controller) {
                      return  Text(
                      controller.username,
                        style: TextStyle(
                          fontSize: isWideScreen ? 28 : 22,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                    
                    ),
                    const SizedBox(height: 10),
                    const Divider(thickness: 1),
                    const SizedBox(height: 10),
                    GetBuilder<ControllerUserInfo>(builder: (controller) => 
                      Wrap(
                        spacing: 20,
                        runSpacing: 10,
                        alignment: WrapAlignment.center,
                        children: [
                          buildInfoCard(Icons.email, "البريد الإلكتروني", controller.email, isWideScreen),
                          buildInfoCard(Icons.male, "الجنس", controller.gender, isWideScreen),
                           buildInfoCard(Icons.male, "الجنسية", controller.country, isWideScreen),
                       //   buildInfoCard(Icons.cake, "العمر", controller.age.toString(), isWideScreen),
                        ],
                      ),
                    ),SizedBox(height: 20,)
                 , ElevatedButton(
              onPressed: () {
                controller.logout();
              
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,// بنفسجي فاتح
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4), // حواف مستطيلة (قليلة الاستدارة)
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // حجم الزر
              ),
              child: Text(
               "تسجيل الخروج",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
            
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  Widget buildInfoCard(IconData icon, String label, String value, bool wide) {
    return SizedBox(
      width: wide ? 300 : double.infinity,
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: Icon(icon, color: Colors.deepPurple),
          title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(value),
        ),
      ),
    );
  }
}