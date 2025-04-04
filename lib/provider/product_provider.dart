import 'package:apiprovider/core/api/api_service.dart';
import 'package:apiprovider/models/item_model.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();
  List<Item> products = [];
  Future<void>? _productsFuture;

  Future<void> fetchProducts() {
    _productsFuture ??= fetchProductsFromApi();
    return _productsFuture!;
  }

  Future<void> fetchProductsFromApi() async {
    try {
      final response = await apiService.fetchProduct();
      products = response.map<Item>((json) => Item.fromJson(json)).toList();
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
