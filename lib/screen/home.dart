import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_dev_test/screen/products/product_screen.dart';
import 'package:mobile_dev_test/screen/setting/setting_screen.dart';
import 'package:mobile_dev_test/screen/theme/theme.dart';
import '../controllers/imagePicker_controller.dart';
import 'auth/auth_screen.dart';


class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final box = GetStorage();
  Map<String, dynamic> getUserData() {
    return box.read('user');
  }

  final ImagePickerController _imagePickerController =
      Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    final userData = getUserData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        title: Center(
          child: Text(
            "Home",
            style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(userData['image']),
                  radius: 45,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${userData['firstName']}  ${userData['lastName']}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text('${userData['email']}'),
                      ElevatedButton(
                        child: Text("Logout"),
                        style: ElevatedButton.styleFrom(
                          primary: bluishClr,
                          elevation: 0,
                        ),
                        onPressed: () {
                          box.remove('user');
                          box.remove('isLoggedIn');
                          Get.offAll(AuthScreen());
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: bluishClr,
                  ),
                  child: const Text(
                    'Products',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    Get.to(product_screen());
                  },
                ),
              ),
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: pinkClr,
                  ),
                  child: const Text(
                    'Setting',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    Get.to(setting_screen());
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _imagePickerController.takePhoto();
        },
        child: const Icon(Icons.camera_alt_sharp),
      ),
    );
  }
}
