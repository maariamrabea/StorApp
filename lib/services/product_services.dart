import 'package:http/http.dart' as http;
import 'package:stor_app/utils/MyString.dart';

import '../model/productmodel.dart';

class ProductServes {
 static Future<List<ProductModels>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}
