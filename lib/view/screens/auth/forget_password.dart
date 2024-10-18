import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stor_app/logic/controllers/outh_controller.dart';
import 'package:stor_app/utils/MyString.dart';
import 'package:stor_app/view/widgets/AuthButton.dart';
import 'package:stor_app/view/widgets/AuthText.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final controller = Get.find<AuthController>();

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,

          appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        title: Text(
          'Forget Password',
          style: TextStyle(color: Get.isDarkMode ? Colors.black : Colors.teal),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Get.isDarkMode ? Colors.white : Colors.teal,
          ),
        ),
      ),
     // backgroundColor: Get.isDarkMode ? Colors.white : Colors.black26,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.teal,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'If you want to recover your account,then please provide your email ID below.',
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.black : Colors.teal),
                ),
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  'image/forgetpass copy.png',
                  width: 250,
                ),
                const SizedBox(
                  height: 20,
                ),
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
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<AuthController>(builder: (_) {
                  return AuthButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        controller.resetPassword(emailController.text.trim());
                      }
                    },
                    text: 'SEND',
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
