import 'package:get/get.dart';
import 'package:stor_app/logic/controllers/main%20controller.dart';
import 'package:stor_app/logic/controllers/paymentcontroller.dart';
import 'package:stor_app/logic/controllers/setting_controller.dart';

class MainBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
    Get.put(PayMentController());

  }
}

