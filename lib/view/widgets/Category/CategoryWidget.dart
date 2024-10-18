import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stor_app/logic/controllers/category-controller.dart';
import 'package:stor_app/view/widgets/Category/category_Items.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key});

  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isCategoryLoading.value) {
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.teal,
        ));
      } else {
        return Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.getCategoryIndex(index);
                      Get.to(()=>CategroyItems());
                    },
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        image:  DecorationImage(
                          image: NetworkImage(
                            controller.image[index],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 10),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            controller.categoryNameList[index],
                            style: const TextStyle(
                                backgroundColor: Colors.black38,
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: controller.categoryNameList.length),);
      }
    });
  }
}
