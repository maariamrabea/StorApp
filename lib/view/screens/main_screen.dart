import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stor_app/logic/controllers/CartController.dart';
import 'package:stor_app/logic/controllers/main%20controller.dart';

import '../../routes/routes.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.teal,
          leading: Container(),
          actions: [
            Obx(
              () => badges.Badge(
                position: badges.BadgePosition.topEnd(top: 0, end: 3),
                badgeAnimation: const badges.BadgeAnimation.slide(),
                badgeContent: Text(
                  CartController().quantity().toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Get.toNamed(Routes.cartScreen);
                    }),
              ),
            ),
          ],
          title: Text(
            controller.title[controller.currentIndex.value],
            style: TextStyle(
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.home,
                  color: Colors.teal,
                ),
                label: '',
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                )),
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.category,
                  color: Colors.teal,
                ),
                label: '',
                activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                )),
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.teal,
                ),
                label: '',
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                )),
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.teal,
                ),
                label: '',
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ))
          ],
          onTap: (index) {
            controller.currentIndex.value = index;
          },
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.tabs.value,
        ),
      );
    }));
  }
}
