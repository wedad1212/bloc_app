import 'package:shared_preferences/shared_preferences.dart';

class HelperSharedPreLang {
  Future<void> setLanguage(String codeLanguage) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("lan", codeLanguage);
  }

  Future<String> getLanguge() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final langugeReturn = prefs.getString("lag");
    if (langugeReturn != null) {
      return langugeReturn;
    }
    return "en";
  }
}
