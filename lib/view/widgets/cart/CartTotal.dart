import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stor_app/logic/controllers/CartController.dart';
import 'package:stor_app/routes/routes.dart';
import 'package:stor_app/view/widgets/text.dart';

import '../../screens/payment_screen.dart';
import '../../screens/payment_screen.dart';

class CartTotal extends StatelessWidget {
  CartTotal({super.key});

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  TextUtils(
                      text: "Total",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white54 : Colors.grey,
                      underLine: TextDecoration.none),
                  Text(
                    "\$${controller.Total}",
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.paymentScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Check Out",
                            style: TextStyle(
                              fontSize: 20,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.shopping_cart,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
