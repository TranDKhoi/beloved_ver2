import 'package:beloved_ver2/utils/language_util.dart';
import 'package:intl/intl.dart';

class FormatUtil {
  static String toShortDate(DateTime dt) {
    return DateFormat.yMd(LanguageUtil.currentLanguage).format(dt);
  }
}
