import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_test/screen/theme/theme.dart';

import '../../controllers/productList_controller.dart';

class product_screen extends StatefulWidget {
  const product_screen({super.key});

  @override
  State<product_screen> createState() => _product_screenState();
}

class _product_screenState extends State<product_screen> {
  final ProductListController _productListController =
      Get.put(ProductListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        iconTheme:
            IconThemeData(color: Get.isDarkMode ? Colors.white : Colors.black),
        title: Text(
          "Home",
          style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Obx(
        () {
          if (_productListController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (_productListController.products.isEmpty) {
            return Center(
              child: Text('No products found'),
            );
          } else {
            return ListView.builder(
              itemCount: _productListController.products.length,
              itemBuilder: (context, index) {
                final product = _productListController.products[index];
                return ListTile(
                  title: Text(product.title,style: TextStyle(fontWeight: FontWeight.w400),),
                  subtitle: Text('${product.description}',maxLines: 1,overflow: TextOverflow.ellipsis,),
                  leading: Container(
                    width: 90, // Specify the desired width
                    height: 90, // Specify the desired height
                    child: Image.network(
                      product.thumbnail,
                      fit: BoxFit.cover, // Adjust the image fit as needed
                    ),
                  ),
                  trailing: Container(
                    width: 70,
                    height: 30,
                    color: bluishClr,
                    child: Center(
                      child: Text(
                        '\$${product.price}',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  // leading: Image.network(product.thumbnail), // Assuming thumbnail is a URL
                );
              },
            );
          }
        },
      ),
    );
  }
}
