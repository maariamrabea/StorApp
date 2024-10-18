import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:stor_app/logic/bindings/auth%20_binding.dart';
import 'package:stor_app/logic/bindings/productbinding.dart';
import 'package:stor_app/view/screens/auth/cart_Screen.dart';
import 'package:stor_app/view/screens/auth/forget_password.dart';
import 'package:stor_app/view/screens/auth/login_screen.dart';
import 'package:stor_app/view/screens/auth/signup_screen.dart';
import 'package:stor_app/view/screens/main_screen.dart';
import 'package:stor_app/view/screens/payment_screen.dart';
import 'package:stor_app/view/screens/welcome_screen.dart';

import '../logic/bindings/main binding.dart';

class AppRoutes {
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;
  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
        name: Routes.loginScreen,
        page: () => LoginScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.signUpScreen,
        page: () => SignUpScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.forgotPasswordScreen,
        page: () => ForgotPasswordScreen(),
        binding: AuthBinding()),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.paymentScreen,
      page: () => PaymentScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/WelcomeScreen';
  static const loginScreen = '/LoginScreen';
  static const signUpScreen = '/SignUpScreen';
  static const forgotPasswordScreen = '/ForgotPasswordScreen';
  static const mainScreen = '/MainScreen';
  static const cartScreen = '/CartScreen';
  static const paymentScreen = '/PaymentScreen';
}
