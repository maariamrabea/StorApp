import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stor_app/view/widgets/text.dart';

import '../../widgets/Category/CategoryWidget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 15),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: TextUtils(
                    text: 'Category',
                    fontWeight: FontWeight.bold,
                    underLine: TextDecoration.none,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 30,
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
             CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
