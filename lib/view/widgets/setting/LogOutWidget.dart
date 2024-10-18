import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stor_app/logic/controllers/outh_controller.dart';

import '../../../utils/them.dart';
import '../text.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (_) => Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Get.defaultDialog(
                    title: "Logout From App",
                    titleStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    middleText: 'Are you sure you need to logout',
                    middleTextStyle:const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.grey,
                    radius: 10,
                    textCancel: "NO",
                    cancelTextColor: Colors.black,
                    textConfirm: 'YES',
                    confirmTextColor: Colors.black,
                    onCancel: () {
                      Get.back();
                    },
                    onConfirm: () {
                      controller.signOutFromApp();
                    },
                    buttonColor: Colors.teal,
                  );
                },
                splashColor: Colors.teal.withOpacity(0.4),
                borderRadius: BorderRadius.circular(12),
                customBorder: const StadiumBorder(),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: darkSettings),
                      child: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextUtils(
                        text: "Logout".tr,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        underLine: TextDecoration.none)
                  ],
                ),
              ),
            ));
  }
}
