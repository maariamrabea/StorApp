import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stor_app/view/widgets/text.dart';

import '../../widgets/setting/DarkWidget.dart';
import '../../widgets/setting/LanguageWidget.dart';
import '../../widgets/setting/LogOutWidget.dart';
import '../../widgets/setting/ProfileImage.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          ProfileImage(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
            thickness: 2,
          ),
          const SizedBox(
            height: 20,
          ),
           TextUtils(
              text: "GENERAL".tr,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
              underLine: TextDecoration.none),
          const SizedBox(
            height: 20,
          ),
          DarkWidget(),
          const SizedBox(
            height: 20,
          ),
          LanguageWidget(),
          const SizedBox(
            height: 20,
          ),
          LogOutWidget(),
        ],
      ),
    );
  }
}
