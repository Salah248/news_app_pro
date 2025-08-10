import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_pro/resources/color_manager.dart';

class StyleManager {
  static final TextStyle heading = GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: 32.sp,
    color: ColorManager.primaryColor,
  );
  static final TextStyle categoryTitle = GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
    color: ColorManager.primaryColor,
  );
  static final TextStyle bodyTitle = GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: 18.sp,
    color: ColorManager.primaryColor,
  );
  static final TextStyle bodySubTitle = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    color: ColorManager.secondaryColor,
  );
  static final TextStyle articleBody = GoogleFonts.merriweather(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: ColorManager.primaryColor,
  );
}
