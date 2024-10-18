import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stor_app/logic/controllers/CartController.dart';
import 'package:stor_app/logic/controllers/productcontroller.dart';
import 'package:stor_app/model/productmodel.dart';
import 'package:stor_app/view/screens/product_Screen.dart';
import 'package:stor_app/view/widgets/text.dart';

import '../../../logic/controllers/category-controller.dart';

class CategroyItems extends StatelessWidget {
  CategroyItems({super.key});

  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text(
            "Category items",
            style: TextStyle(
              color:  Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal
        ),
        body: Obx(() {
          if (categoryController.isAllCategory.value) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.teal,
            ));
          } else {
            return GridView.builder(
                itemCount: categoryController.categoryList.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 9.0,
                    crossAxisSpacing: 6.0,
                    maxCrossAxisExtent: 200),
                itemBuilder: (context, index) {
                  return buildCardItems(
                      image: categoryController.categoryList[index].image,
                      rate: categoryController.categoryList[index].rating.rate,
                      price: categoryController.categoryList[index].price,
                      productId: categoryController.categoryList[index].id,
                      productModels: categoryController.categoryList[index],
                      onTap: () {
                        Get.to(() => ProductScreen(
                              productModels: categoryController.categoryList[index],
                            ));
                      });
                });
          }
        }));
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required ProductModels productModels,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                  ),
                ]),
            child: Column(
              children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.mangeFavourites(productId);
                        },
                        icon: controller.isFavourites(productId)
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_outline,
                                color: Colors.black,
                              ),
                      ),
                      IconButton(
                          onPressed: () {
                            cartController.addProductToCart(productModels);
                          },
                          icon: const Icon(
                            Icons.shopping_basket_sharp,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
                Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.network(
                    image,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ $price",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3, right: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextUtils(
                                  text: "$rate",
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  underLine: TextDecoration.none,
                                ),
                                const Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          )),
    );
  }
}
