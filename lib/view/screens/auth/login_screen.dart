import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stor_app/logic/controllers/outh_controller.dart';
import 'package:stor_app/routes/routes.dart';
import 'package:stor_app/utils/MyString.dart';
import 'package:stor_app/view/widgets/AuthButton.dart';
import 'package:stor_app/view/widgets/AuthText.dart';
import 'package:stor_app/view/widgets/ContainerUnder.dart';
import 'package:stor_app/view/widgets/text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      //  backgroundColor: context.theme.backgroundColor,

        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
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
                                text: 'LOG',
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
                              text: 'IN',
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.forgotPasswordScreen);
                              },
                              child: TextUtils(
                                text: 'Forget Password?',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Get.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
                                underLine: TextDecoration.none,
                              )),
                        ),
                        const SizedBox(height: 30),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            text: 'LOGIN',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                String email = emailController.text.trim();
                                String password =
                                    passwordController.text.trim();
                                controller.logInFirebase(
                                    email: email, password: password);
                              }
                            },
                          );
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        TextUtils(
                          text: 'OR',
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                          underLine: TextDecoration.none,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Image.asset('image/facebook.png'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GetBuilder<AuthController>(builder: (_) {
                              return InkWell(
                                onTap: () {
                                  controller.googleSignApp();
                                },
                                child: Image.asset('image/google.png'),
                              );
                            })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: "Don't have an Account?",
                onPressed: () {
                  Get.offNamed(Routes.signUpScreen);
                },
                textt: 'Sign up',
              )
            ],
          ),
        ),
      ),
    );
  }
}
