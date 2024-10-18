import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/MyString.dart';

class SettingController extends GetxController {
  var switchValue = false.obs;
  var storage = GetStorage();
  var longLocal = ene;

  String capitalize(String profilename) {
    return profilename.split(" ").map((name) => name.capitalize).join(" ");
  }

  //Language
  @override
  void onInit() async {
    super.onInit();
    longLocal = await getLanguage;
  }

  void saveLanguage(String lang) async {
    await storage.write("Lang", lang);
  }

  Future<String> get getLanguage async {
    return await storage.read("Lange");
  }

  void changeLanguage(String typeLang) {
    saveLanguage(typeLang);
    if (longLocal == typeLang) {
      return;
    }
    if (typeLang == frf) {
      longLocal = frf;
      saveLanguage(frf);
    } else if (typeLang == ara) {
      longLocal = ara;
      saveLanguage(ara);
    } else {
      longLocal = ene;
      saveLanguage(ene);
    }
    update();
  }
}
