import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zavisoft_task/feature/home/models/product_model.dart';

class HomeController extends GetxController {
  final Dio _dio = Dio();

  var electronics = <Product>[].obs;
  var jewelery = <Product>[].obs;
  var mensClothing = <Product>[].obs;
  final tabs = const [
    Tab(text: "Electronics"),
    Tab(text: "Jewelery"),
    Tab(text: "Men"),
  ];
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;

      final response = await _dio.get("https://fakestoreapi.com/products");

      final List productsJson = response.data;

      final List<Product> allProducts = productsJson
          .map((e) => Product.fromJson(e))
          .toList();

      electronics.value = allProducts
          .where((e) => e.category == 'electronics')
          .toList();

      jewelery.value = allProducts
          .where((e) => e.category == 'jewelery')
          .toList();

      mensClothing.value = allProducts
          .where((e) => e.category == "men's clothing")
          .toList();
    } finally {
      isLoading.value = false;
    }
  }
}
