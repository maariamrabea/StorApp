import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stor_app/logic/controllers/CartController.dart';
import 'package:stor_app/model/productmodel.dart';
import 'package:stor_app/view/widgets/text.dart';

class AddCart extends StatelessWidget {
   AddCart({super.key, required this.price, required this.productModels});

  final double price;
  final ProductModels productModels;
final controller=Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           const   TextUtils(
                  text: "price",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  underLine: TextDecoration.none),
              Text(
                "\$$price",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                    backgroundColor: Colors.teal),
                onPressed: () {controller.addProductToCart(productModels);},
                child:const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                          fontSize: 20, height: 1.5, color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),Icon(Icons.shopping_cart_outlined,color: Colors.white,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
