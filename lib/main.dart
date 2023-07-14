import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_dev_test/screen/auth/auth_screen.dart';
import 'package:mobile_dev_test/screen/home.dart';
import 'package:mobile_dev_test/screen/theme/theme.dart';
import 'package:mobile_dev_test/services/theme_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final box = GetStorage();
  bool isLoggedIn = box.read('isLoggedIn')as bool? ?? false;
  print(isLoggedIn);

  runApp(
    MyApp(),
  );
  // if (user != null) {
  //   print("aa");

  // } else {
  //    print("bb");
  //     Get.to(AuthScreen());
  // }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final box = GetStorage();
  bool? get isLoggedIn => box.read('isLoggedIn') as bool? ?? false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      //home: AuthScreen(),
      //home: statusLogin != null && statusLogin == true ? home_page() :  AuthScreen(),
      home: isLoggedIn == true  ?  home_page() : AuthScreen()
    );
  }
}

// List<Product> productFromJson(String str) =>
//     List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

// String productToJson(List<Product> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
///////
// main() async {
//   runApp(GetMaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: AuthScreen(),
//   ));
// }

////////
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: AuthScreen()
//     );
//   }
// }

