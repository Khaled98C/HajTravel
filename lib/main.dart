import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/middelware/OnpordMidelware.dart';
import 'package:project/pages/homeScreen.dart';
import 'package:project/pages/makkapage.dart';
import 'package:project/pages/testonlynavbottombar.dart';

import 'Server/binding.dart';
import 'Server/server.dart';

import 'pages/home_pagenav.dart';
import 'pages/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(fontFamily: 'Cairo'),
      getPages: [
        GetPage(
            name: "/",
            page: () => WelcomePage(),
            middlewares: [OnpordMidelware()]),
        GetPage(name: "/homepage", page: () => HomepageMain()),
      
        GetPage(name: "/makapage", page: () => MakkahPage()),
      ],
      initialRoute: "/",
      initialBinding: InitialBinding(),
    );
  }
}
