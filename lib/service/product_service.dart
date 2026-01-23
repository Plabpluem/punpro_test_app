import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:punpro_test_app/models/product.dart';

class ProductService {
  Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(
        Uri.parse("https://dummyjson.com/products2"),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List list = data["products"];
        final listJson = list.map((item) => Product.fromJson(item)).toList();
        return listJson;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
