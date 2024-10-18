import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stor_app/logic/controllers/outh_controller.dart';
import 'package:stor_app/routes/routes.dart';
import 'package:stor_app/utils/MyString.dart';
import 'package:stor_app/view/widgets/AuthButton.dart';
import 'package:stor_app/view/widgets/AuthText.dart';
import 'package:stor_app/view/widgets/CheckWidget.dart';
import 'package:stor_app/view/widgets/ContainerUnder.dart';
import 'package:stor_app/view/widgets/text.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();

  bool isLoading = false;
  static String id = 'RegisterPage';

  // GlobalKey<FormState> formKey = GlobalKey();
  //final controllers = Get.lazyPut(() => AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       // backgroundColor: context.theme.backgroundColor,

        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black26,
          elevation: 0,
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : Colors.black26,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                                text: 'SIGN',
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode
                                    ? Colors.tealAccent
                                    : Colors.teal,
                                underLine: TextDecoration.none),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                              text: 'UP',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                              underLine: TextDecoration.none,
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        AuthTextFormFiled(
                          controller: nameController,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid name';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Image.asset('image/user.png'),
                          suffixIcon: const Text(""),
                          hintText: 'User Name',
                        ),
                        const SizedBox(height: 20),
                        AuthTextFormFiled(
                          controller: emailController,
                          obscureText: false,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return 'Invalid Email';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Image.asset('image/email.png'),
                          suffixIcon: const Text(""),
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 20),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthTextFormFiled(
                              controller: passwordController,
                              obscureText:
                                  controller.isVisibilty ? false : true,
                              validator: (value) {
                                if (value.toString().length < 5) {
                                  return 'Password should be longer or equal to 6 char';
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon: Image.asset('image/lock.png'),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibilty();
                                },
                                icon: controller.isVisibilty
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      ),
                              ),
                              hintText: 'Password',
                            );
                          },
                        ),
                        const SizedBox(height: 50),
                        CheckWidget(),
                        const SizedBox(height: 10),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            text: 'SIGN UP',
                            onPressed: () {
                              if (controller.isCheckBox == false) {
                                Get.snackbar('Check Box',
                                    'please, Accept terms & conditions',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white);
                              }

                              else if (formKey.currentState!.validate()) {
                                String name = nameController.text.trim();
                                String email = emailController.text.trim();
                                String password = passwordController.text;
                                controller.signUpFirebase(
                                    name: name,
                                    email: email,
                                    password: password);

                                controller.isCheckBox=true;
                              }
                            },
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: 'Already have an Account?',
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
                textt: 'Log in',
              )
            ],
          ),
        ),
      ),
    );
  }
}
