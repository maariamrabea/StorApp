import 'package:get/get.dart';
import 'package:stor_app/logic/controllers/outh_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(AuthController());
  }

}