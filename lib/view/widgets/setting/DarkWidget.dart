import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stor_app/logic/controllers/setting_controller.dart';
import 'package:stor_app/utils/them.dart';
import 'package:stor_app/view/widgets/text.dart';

import '../../../logic/controllers/themecontroller.dart';

class DarkWidget extends StatelessWidget {
  DarkWidget({super.key});

  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildIconWidget(),
            Switch(
                activeTrackColor: Colors.teal,
                activeColor: Colors.white,
                value: controller.switchValue.value,
                onChanged: (value) {
                  ThemeController().changesTheme();
                  controller.switchValue.value = value;
                })
          ],
        ));
  }
}

Widget buildIconWidget() {
  return Material(
    color: Colors.transparent,
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: darkSettings),
          child: const Icon(
            Icons.dark_mode,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        TextUtils(
            text: "Dark Mode".tr,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            underLine: TextDecoration.none)
      ],
    ),
  );
}
