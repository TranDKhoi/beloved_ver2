import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  static late SharedPreferences _pref;

  static init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static String? getCurrentLang() {
    return _pref.getString("language");
  }

  static void setCurrentLang(String currentLang) {
    _pref.setString("language", currentLang);
  }

  static bool? getCurrentTheme() {
    return _pref.getBool("theme");
  }

  static void setCurrentTheme(bool isDark) {
    _pref.setBool("theme", isDark);
  }

  static String? getUserToken() {
    return _pref.getString("userToken");
  }

  static void setUserToken(String token) {
    _pref.setString("userToken", token);
  }
}
