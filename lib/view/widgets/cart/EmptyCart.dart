import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stor_app/routes/routes.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Icon(
        Icons.shopping_cart,
        size: 150,
        color: Get.isDarkMode ? Colors.white : Colors.black,
      ),
      const SizedBox(
        height: 40,
      ),
      RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "Your Cart is",
              style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextSpan(
              text: "Empty",
              style: TextStyle(
                color: Colors.teal,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ])),
      const SizedBox(
        height: 10,
      ),
     const Text(
        "Add Items to get Started",
        style: TextStyle(
          color: Colors.white ,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
     const SizedBox(height: 50,),
      SizedBox(

        height: 50,
        child: ElevatedButton(

          onPressed: () {
            Get.toNamed(
              Routes.mainScreen,
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),

            elevation: 0,
          ),

          child:  Text("Go to Home", style: TextStyle(
            fontSize: 20,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          ),
        ),),
        ],
      ),
    );
  }
}
