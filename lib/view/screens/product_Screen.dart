import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/productmodel.dart';
import '../widgets/productDetels/AddCart.dart';
import '../widgets/productDetels/ClothInfo.dart';
import '../widgets/productDetels/ImageSlider.dart';
import '../widgets/productDetels/SizeList.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.productModels});

  final ProductModels productModels;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlider(
                imageUrl: productModels.image,
              ),
              ClothInfo(
                title: productModels.title,
                productId: productModels.id,
                rate: productModels.rating.rate,
                text: productModels.description,
              ),
              SizeList(),
              AddCart(
                price: productModels.price,
                productModels: productModels,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
