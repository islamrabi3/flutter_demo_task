import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static Future<SharedPreferences> intit() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }
}
