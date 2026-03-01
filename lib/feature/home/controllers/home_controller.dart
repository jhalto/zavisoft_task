import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Dio _dio = Dio();

  var electronics = <dynamic>[].obs;
  var jewelery = <dynamic>[].obs;
  var mensClothing = <dynamic>[].obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;

      final response =
          await _dio.get("https://fakestoreapi.com/products");

      final products = response.data;

      electronics.value =
          products.where((e) => e['category'] == 'electronics').toList();

      jewelery.value =
          products.where((e) => e['category'] == 'jewelery').toList();

      mensClothing.value =
          products.where((e) => e['category'] == "men's clothing").toList();

    } finally {
      isLoading.value = false;
    }
  }
}