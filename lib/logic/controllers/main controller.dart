import 'package:get/get.dart';
import 'package:stor_app/view/screens/auth/category_screen.dart';
import 'package:stor_app/view/screens/auth/favorites_screen.dart';
import 'package:stor_app/view/screens/auth/setting_screen.dart';
import 'package:stor_app/view/screens/home_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  final tabs = [
    Homepage(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingScreen(),
  ].obs;

  final title = ["SHOP",
    "Categories",
    "Favourites",
    "Setting"].obs;
}
