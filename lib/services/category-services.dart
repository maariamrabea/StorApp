import 'package:http/http.dart' as http;
import 'package:stor_app/utils/MyString.dart';

import '../model/category_model.dart';
import '../model/productmodel.dart';

class CategoryServices {
  static Future<List<String>> getCategory() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoryModelsFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}
class AllCategoryServes {
  static Future<List<ProductModels>> getAllCategory(String categoryName) async {
    var response = await http.get(Uri.parse('$baseUrl/products/category/$categoryName'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}