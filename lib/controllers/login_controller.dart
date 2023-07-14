import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_dev_test/screen/home.dart';
import 'package:http/http.dart' as http;
import '../services/api_endpoint.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final box = GetStorage();

  Future<void> loginWithEmail() async {

    var headers = {'Content-Type': 'application/json'};
   
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);

      Map body = {
        'username': emailController.text.trim(),
        'password': passwordController.text
      };

      http.Response response = await http.post(
        url,
        body: jsonEncode(body),
        headers: headers,
      );


      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        box.write('user', json);
        box.write('isLoggedIn', true);
        emailController.clear();
        passwordController.clear();
        Get.off(home_page());
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: Text('Error'),
            contentPadding: EdgeInsets.all(20),
            children: [Text(error.toString())],
          );
        },
      );
    }
  }
}
