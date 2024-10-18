import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stor_app/logic/controllers/CartController.dart';

import '../../widgets/cart/CartProductCart.dart';
import '../../widgets/cart/CartTotal.dart';
import '../../widgets/cart/EmptyCart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("CartItems"),
          elevation: 0,
          backgroundColor: Colors.teal,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.ClearAllProducts();
              },
              icon: const Icon(Icons.backspace),
            )
          ],
        ),
        body: //,
            Obx(
          () {
            if (controller.productsMap.isEmpty) {
              return const EmptyCart();
            } else {
              return Column(
                children: [
                  SingleChildScrollView(
                    child: SizedBox(
                      height: 645,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CartProductCart(
                              index: index,
                              productModels:
                                  controller.productsMap.keys.toList()[index],
                              quntenty:
                                  controller.productsMap.values.toList()[index],
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 20,
                              ),
                          itemCount: controller.productsMap.length),
                    ),
                  ),
               //   SizedBox(height: 20,),
                  CartTotal(),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
