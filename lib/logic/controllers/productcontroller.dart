import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stor_app/model/productmodel.dart';

import '../../services/product_services.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var favouritesList = <ProductModels>[].obs;
  var storage = GetStorage();

//search
  var searchList = <ProductModels>[].obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    List? storagedd = storage.read<List>("isFavourites");
    if (storagedd != null) {
      favouritesList =
          storagedd.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
    var products = await ProductServes.getProduct();
    try {
      isLoading(true);

      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  //logic for favorites screen

  void mangeFavourites(int productId) async {
    var indexx =
        favouritesList.indexWhere((element) => element.id == productId);
    if (indexx >= 0) {
      await storage.remove("isFavourites");
      favouritesList.removeAt(indexx);
    } else {
      favouritesList
          .add(productList.firstWhere((element) => element.id == productId));
      await storage.write("isFavourites", favouritesList);
    }
  }

  bool isFavourites(int productId) {
    return favouritesList.any((element) => element.id == productId);
  }

  //search Bar Logic
  void addSearchTiList(String searchName) {
    searchName = searchName.toLowerCase();

    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();
      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();
    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchTiList("");
  }
}
