import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/SettingsController.dart';
import '../Controller/ThemeController.dart';
import '../Server/server.dart';


class SettingsPage extends StatelessWidget {
  final SettingsController controller = Get.put(SettingsController());
  final ThemeController themeController = Get.find();
    final MyServices myServices = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('5'.tr)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text("6".tr),
              trailing: DropdownButton<String>(
                value: Get.locale?.languageCode ?? 'ar',
                items: const [
                  DropdownMenuItem(value: 'ar', child: Text("العربية")),
                  DropdownMenuItem(value: 'en', child: Text("English")),
                ],
                onChanged: (value) {
                  if (value != null) {
                    controller.changeLanguage(value);
                  }
                },
              ),
            ),
            Obx(() => SwitchListTile(
                title: Text("7".tr),
                value: themeController.isDark.value,
                onChanged: (val) {
                  themeController.toggleTheme();
                },
              )),
            const Divider(),
            ListTile(
              title: Text("8".tr),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => controller.clearData(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
