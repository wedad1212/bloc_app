import 'package:shared_preferences/shared_preferences.dart';

class HelperSharedPreTheme {
 Future<void> setTheme(bool theme) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool("theme", !theme);
  }

  Future<bool> getTheme() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getBool("theme") ?? false;
  }
}
