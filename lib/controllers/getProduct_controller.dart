import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/product_model.dart';
import '../services/api_endpoint.dart';

class getProductController {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.getProducts));

    if (response.statusCode == 200) {
       final jsonData = json.decode(response.body);
      final productsData = jsonData['products'] as List<dynamic>;
      final products = productsData.map((productData) => Product.fromJson(productData)).toList();
      return products;
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
