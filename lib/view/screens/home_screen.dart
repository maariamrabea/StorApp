import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/CardItems.dart';
import '../widgets/searchTextForm.dart';
import '../widgets/text.dart';

 class Homepage extends StatelessWidget {
   const Homepage({super.key});

   @override
   Widget build(BuildContext context) {
     return SafeArea(
       child: Scaffold(
         backgroundColor: context.theme.backgroundColor,
         body: Column(
           children: [
             Container(
               width: double.infinity,
               height: 180,
               decoration: const BoxDecoration(
                   color: Colors.teal,
                   borderRadius: BorderRadius.only(
                     bottomLeft: Radius.circular(20),
                     bottomRight: Radius.circular(20),
                   )),
               child:  Padding(
                 padding:const EdgeInsets.only(left: 20, right: 20),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const   TextUtils(
                         text: 'Find Your',
                         fontSize: 25,
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                         underLine: TextDecoration.none),
                     const   SizedBox(
                       height: 5,
                     ),
                     const   TextUtils(
                         text: 'INSPIRATION',
                         fontSize: 28,
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                         underLine: TextDecoration.none),
                     const   SizedBox(
                       height: 20,
                     ),
                     SearchFromText(),
                   ],
                 ),
               ),
             ),
             const SizedBox(
               height: 10,
             ),
             Padding(
               padding: const EdgeInsets.only(left: 20),
               child: Align(
                 alignment: Alignment.topLeft,
                 child: TextUtils(
                     text: "Categories",
                     fontSize: 25,
                     fontWeight: FontWeight.w500,
                     color: Get.isDarkMode ? Colors.white : Colors.black,
                     underLine: TextDecoration.none),
               ),
             ),
             const SizedBox(
               height: 30,
             ),
             CardItems(),
           ],
         ),
       ),
     );
   }
 }
