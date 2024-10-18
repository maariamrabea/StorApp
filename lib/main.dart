import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stor_app/routes/routes.dart';
import 'package:stor_app/utils/MyString.dart';
import 'package:stor_app/utils/them.dart';
import 'package:stor_app/view/screens/welcome_screen.dart';
import 'language/localiztion.dart';
import 'logic/controllers/themecontroller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        locale: Locale(GetStorage().read<String>('lang').toString(),),
        fallbackLocale: Locale(ene),
        translations: LocaliztionApp(),
        theme: ThemesApp.light,
        darkTheme: ThemesApp.dark,
        themeMode: ThemeController().themeDataGet,
        home: const WelcomeScreen(),
        initialRoute: FirebaseAuth.instance.currentUser != null ||
                GetStorage().read<bool>("auth") == true
            ? AppRoutes.welcome
            : AppRoutes.mainScreen,
        getPages: AppRoutes.routes);
  }
}
