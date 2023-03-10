import 'dart:ui' as ui;
import 'dart:ui';

import '../configs/langs/en.dart';
import '../configs/langs/vi.dart';
import '../services/shared_service.dart';

class LanguageUtil {
  static final LanguageUtil ins = LanguageUtil._();

  LanguageUtil._();

  static String currentLanguage = "vi";

  List<Locale> supportedLocales = const [
    Locale('vi'),
    Locale('en'),
  ];

  Locale currentLocale = const Locale('en');

  final Map<String, Map<String, String>> _languageValueMap = {
    'en': enLang,
    'vi': viLang,
  };

  List<LanguageModel> languages = [
    LanguageModel(
      id: "vi",
      name: "Tiếng Việt",
      countryCode: 'vn',
    ),
    LanguageModel(
      id: "en",
      name: "English",
      countryCode: 'us',
    ),
  ];

  String getLanguageName(String id) {
    for (LanguageModel item in languages) {
      if (item.id == id) {
        return item.name;
      }
    }
    return "Tiếng Việt";
  }

  String langContent(String id) {
    String? content = _languageValueMap[currentLanguage]?[id];
    return content ?? "???";
  }

  void getLocalLanguage() async {
    var res = SharedService.getCurrentLang();
    if (res == null) {
      currentLanguage = ui.window.locale.languageCode;
    } else {
      if (!languages.map((e) => e.id).toList().contains(currentLanguage)) {
        currentLanguage = "en";
      }
    }
  }

  _updateLocalLanguage(String langCode) {
    currentLanguage = langCode;
    currentLocale = Locale(langCode);
    SharedService.setCurrentLang(currentLanguage);
  }

  void changeLanguage(String langCode) {
    for (var item in languages) {
      if (item.id == langCode) {
        _updateLocalLanguage(langCode);
      }
    }
  }
}

class LanguageModel {
  String id;
  String name;
  String countryCode;

  LanguageModel({
    required this.id,
    required this.name,
    required this.countryCode,
  });
}
