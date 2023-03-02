import 'package:beloved_ver2/utils/language_util.dart';
import 'package:intl/intl.dart';

class FormatUtil {
  static String toShortDate(DateTime dt) {
    return DateFormat.yMd(LanguageUtil.currentLanguage).format(dt);
  }

  static String countYear(DateTime day) {
    return ((DateTime.now().year - day.year).abs()).toString();
  }

  static String countDay(DateTime beginDay) {
    return (DateTime.now().difference(beginDay).inDays + 1).toString();
  }
}
