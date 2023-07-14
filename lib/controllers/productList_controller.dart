import 'package:get/get.dart';
import 'package:mobile_dev_test/controllers/getProduct_controller.dart';

import '../model/product_model.dart';

class ProductListController extends GetxController {
  final getProductController _apiService = getProductController();
  final products = <Product>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      final productList = await _apiService.fetchProducts();
      print(productList);
      products.assignAll(productList);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
