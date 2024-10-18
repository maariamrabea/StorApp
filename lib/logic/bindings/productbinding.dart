import 'package:get/get.dart';
import 'package:stor_app/logic/controllers/CartController.dart';
import 'package:stor_app/logic/controllers/category-controller.dart';
import 'package:stor_app/logic/controllers/productcontroller.dart';
import 'package:stor_app/logic/controllers/setting_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  //  Get.put(SettingController());
  }
}