import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_test/screen/auth/widgets/input_fields.dart';
import 'package:mobile_dev_test/screen/auth/widgets/submit_button.dart';
import '../../controllers/login_controller.dart';
import '../theme/theme.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // RegisterationController registerationController =
  //   Get.put(RegisterationController());

  LoginController loginController = Get.put(LoginController());
  var isLogin = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(36),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 30,
                          color: Get.isDarkMode ? white : darkGreyClr,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                   SizedBox(
                    height: 20,
                  ),
                  Text(
                      'Welcome back',
                      style: TextStyle(
                          fontSize: 16,
                          color: Get.isDarkMode ? white : Colors.grey,
                          ),
                    ),Text(
                      'Please login to your account',
                      style: TextStyle(
                          fontSize: 16,
                          color: Get.isDarkMode ? white : Colors.grey,
                          ),
                    ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  loginWidget()
                ],
              ),
          ),
        ),
      ),
    );
  }


  Widget loginWidget() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(loginController.emailController, 'username'),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(loginController.passwordController, 'password',),
        SizedBox(
          height: 20,
        ),
        SubmitButton(
          onPressed: () {
            loginController.loginWithEmail();
          },
          title: 'Login',
        )
      ],
    );
  }
}
