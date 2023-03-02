import 'package:flutter/material.dart';

import 'colors.dart';
import 'font_size.dart';

class AppStyle {
  static const TextStyle normalTextStyle =
      TextStyle(color: Colors.black, fontSize: AppFontSize.normalFontSize);

  static const TextStyle pinkBoldNormal =
      TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold);

  static const TextStyle pinkBoldTitle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: AppFontSize.titleFontSize,
    color: AppColor.primaryColor,
  );

  static const TextStyle underlineBlueNormal = TextStyle(
    color: Colors.blueGrey,
    decoration: TextDecoration.underline,
  );

  static const TextStyle whiteBoldTitle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: AppFontSize.titleFontSize,
    color: Colors.white,
  );
}
