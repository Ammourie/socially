import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Centralized the text styles that are used widely in app
class TextThemeStyles {
  static const _fontFamily = 'Roboto';
  static final _fontSizeDelta = 25.sp;

  static final displayLarge =
      TextStyle(fontSize: 112.sp + _fontSizeDelta, fontFamily: _fontFamily);
  static final displayMedium =
      TextStyle(fontSize: 56.sp + _fontSizeDelta, fontFamily: _fontFamily);
  static final displaySmall =
      TextStyle(fontSize: 45.sp + _fontSizeDelta, fontFamily: _fontFamily);
  static final headlineMedium =
      TextStyle(fontSize: 34.sp + _fontSizeDelta, fontFamily: _fontFamily);
  static final headlineSmall =
      TextStyle(fontSize: 24.sp + _fontSizeDelta, fontFamily: _fontFamily);
  static final titleLarge =
      TextStyle(fontSize: 21.sp + _fontSizeDelta, fontFamily: _fontFamily);

  static final titleMedium =
      TextStyle(fontSize: 17.sp + _fontSizeDelta, fontFamily: _fontFamily);
  static final titleSmall =
      TextStyle(fontSize: 15.sp + _fontSizeDelta, fontFamily: _fontFamily);

  static final bodyLarge =
      TextStyle(fontSize: 15.sp + _fontSizeDelta, fontFamily: _fontFamily);
  static final bodyMedium =
      TextStyle(fontSize: 15.sp + _fontSizeDelta, fontFamily: _fontFamily);

  static final bodySmall =
      TextStyle(fontSize: 13.sp + _fontSizeDelta, fontFamily: _fontFamily);

  static final labelLarge =
      TextStyle(fontSize: 13.sp + _fontSizeDelta, fontFamily: _fontFamily);

  static final labelSmall =
      TextStyle(fontSize: 11.sp + _fontSizeDelta, fontFamily: _fontFamily);

  static final robotoRegular =
      TextStyle(fontSize: 15.sp + _fontSizeDelta, fontFamily: _fontFamily);

  static final robotoMedium =
      TextStyle(fontSize: 15.sp + _fontSizeDelta, fontFamily: _fontFamily);

  static final robotoBold =
      TextStyle(fontSize: 15.sp + _fontSizeDelta, fontFamily: _fontFamily);
}
