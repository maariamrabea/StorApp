import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stor_app/routes/routes.dart';

import '../../model/productmodel.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProductToCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels)) {
      productsMap[productModels] += 1;
    } else {
      productsMap[productModels] = 1;
    }
   // Get.snackbar('Error',"$productsMap[productModels]",
   //     snackPosition: SnackPosition.BOTTOM,
   //     backgroundColor: Colors.red,
   //     colorText: Colors.white);



  }

  void removeProductsFromCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels) &&
        productsMap[productModels] == 1) {
      productsMap.removeWhere((key, value) => key == productModels);
    } else {
      productsMap[productModels] -= 1;
    }
  }

  void removeOneProduct(ProductModels productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void ClearAllProducts() {
    Get.defaultDialog(
      title: "Clear Products",
      titleStyle: const TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
      middleText: 'Are you sure you clear products',
      middleTextStyle: const TextStyle(
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
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      buttonColor: Colors.teal,
    );
  }

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get Total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
