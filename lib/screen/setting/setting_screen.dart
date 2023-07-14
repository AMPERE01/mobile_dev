import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../services/theme_service.dart';

class setting_screen extends StatefulWidget {
  setting_screen({super.key});

  @override
  State<setting_screen> createState() => _setting_screenState();
}

class _setting_screenState extends State<setting_screen> {
  final box = GetStorage();
  Map<String, dynamic> getUserData() {
    return box.read('user');
  }

  @override
  Widget build(BuildContext context) {
    final userData = getUserData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        iconTheme:
            IconThemeData(color: Get.isDarkMode ? Colors.white : Colors.black),
        title: Text(
          "Setting",
          style: TextStyle(
            color: Get.isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
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
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView(
              children: ListTile.divideTiles(
                context: context,
                color: Colors.grey,
                tiles: [
                  ListTile(
                    leading: Icon(
                      Get.isDarkMode ? Icons.nightlight_round : Icons.sunny,
                      size: 20,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    title:
                        Get.isDarkMode ? Text("Dark Mode") : Text("Light Mode"),
                    trailing: Switch(
                      value: Get.isDarkMode,
                      onChanged: (bool value) {
                        ThemeService().switchTheme();
                      },
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.language,size: 20,
                      color: Get.isDarkMode ? Colors.white : Colors.black,),
                    title: Text('Language'),
                  ),
                  ListTile(
                     leading: Icon(Icons.all_inclusive_sharp,size: 20,
                      color: Get.isDarkMode ? Colors.white : Colors.black,),
                    title: Text('Version'),
                  ),
                ],
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
