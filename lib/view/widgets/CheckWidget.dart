import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stor_app/logic/controllers/outh_controller.dart';
import 'package:stor_app/view/widgets/text.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.isCheckBox
                  ? Image.asset('image/check.png')
                  : Container(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(
                text: 'I accept',
                fontSize: 18,
                fontWeight: FontWeight.normal,
                underLine: TextDecoration.none,
                color: Get.isDarkMode ? Colors.black : Colors.white,
              ),
              const SizedBox(
                width: 3,
              ),
              TextUtils(
                text: 'term & conditions',
                fontSize: 18,
                fontWeight: FontWeight.normal,
                underLine: TextDecoration.underline,
                color: Get.isDarkMode ? Colors.black : Colors.white,
              )
            ],
          )
        ],
      );
    });
  }
}
