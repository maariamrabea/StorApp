import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stor_app/logic/controllers/outh_controller.dart';
import 'package:stor_app/logic/controllers/setting_controller.dart';
import 'package:stor_app/view/widgets/text.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage({super.key});

  final controller = Get.find<SettingController>();
final authController=Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Obx(() =>  Row(
         children: [
           Container(
             height: 100,
             width: 100,
             decoration:  BoxDecoration(
               color: Colors.white,
               shape: BoxShape.circle,
               image: DecorationImage(
                   image: NetworkImage(
                     authController.disPlayPhoto.value,
                   ),
                   fit: BoxFit.cover),
             ),
           ),
           const SizedBox(
             width: 15,
           ),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               TextUtils(
                   text: controller.capitalize(authController.displayUsername.value),
                   fontSize: 22,
                   fontWeight: FontWeight.bold,
                   color: Get.isDarkMode ? Colors.white : Colors.black,
                   underLine: TextDecoration.none),
               TextUtils(
                   text: authController.disPlayEmail.value,
                   fontSize: 14,
                   fontWeight: FontWeight.bold,
                   color: Get.isDarkMode ? Colors.white : Colors.black,
                   underLine: TextDecoration.none),
             ],
           )
         ],
       ))
      ],
    );
  }
}
