import 'dart:ui';

import 'package:bootcamp/core/theming/Color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class textstyle {
  static TextStyle mainTitle = TextStyle(
      fontSize: 25.sp,
      color: colors.text,
      fontFamily: 'Lexend',
      fontWeight: FontWeight.bold);

  static TextStyle SubTitle =
      TextStyle(fontSize: 18.sp, color: colors.subtext, fontFamily: 'Lexend');

  double fontsize(int length, int font) {
    if (length >= 80)
      return font.sp;
    else if (length >= 50)
      return 18.sp;
    else if (length >= 30)
      return 20.sp;
    else
      return 20.sp;
  }

  double subfontsize(int length) {
    if (length >= 80)
      return 12.sp;
    else if (length >= 50)
      return 15.sp;
    else if (length >= 30)
      return 18.sp;
    else
      return 15.sp;
  }
}
