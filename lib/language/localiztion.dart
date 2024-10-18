import 'package:get/route_manager.dart';
import '../utils/MyString.dart';
import 'are.dart';
import 'eng.dart';
import 'fre.dart';

class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}
