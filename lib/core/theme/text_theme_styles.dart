import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Centralized the text styles that are used widely in app
class TextThemeStyles {
  static const robotoFamily = 'Roboto';
  static const gloryFamily = 'Glory';

  static final displayLarge =
      TextStyle(fontSize: 112.sp, fontFamily: robotoFamily);
  static final displayMedium =
      TextStyle(fontSize: 56.sp, fontFamily: robotoFamily);
  static final displaySmall =
      TextStyle(fontSize: 45.sp, fontFamily: robotoFamily);
  static final headlineMedium =
      TextStyle(fontSize: 34.sp, fontFamily: robotoFamily);
  static final headlineSmall =
      TextStyle(fontSize: 24.sp, fontFamily: robotoFamily);
  static final titleLarge =
      TextStyle(fontSize: 21.sp, fontFamily: robotoFamily);

  static final titleMedium =
      TextStyle(fontSize: 17.sp, fontFamily: robotoFamily);
  static final titleSmall =
      TextStyle(fontSize: 15.sp, fontFamily: robotoFamily);

  static final bodyLarge = TextStyle(fontSize: 15.sp, fontFamily: robotoFamily);
  static final bodyMedium =
      TextStyle(fontSize: 15.sp, fontFamily: robotoFamily);

  static final bodySmall = TextStyle(fontSize: 13.sp, fontFamily: robotoFamily);

  static final labelLarge =
      TextStyle(fontSize: 13.sp, fontFamily: robotoFamily);

  static final labelSmall =
      TextStyle(fontSize: 11.sp, fontFamily: robotoFamily);
  static final robotoRegular =
      TextStyle(fontSize: 15.sp, fontFamily: robotoFamily);

  static final robotoMedium =
      TextStyle(fontSize: 15.sp, fontFamily: robotoFamily);

  static final robotoBold =
      TextStyle(fontSize: 15.sp, fontFamily: robotoFamily);

  static final gloryRegular =
      TextStyle(fontSize: 15.sp, fontFamily: gloryFamily);

  static final gloryMedium =
      TextStyle(fontSize: 15.sp, fontFamily: gloryFamily);

  static final gloryBold = TextStyle(fontSize: 15.sp, fontFamily: gloryFamily);
}
