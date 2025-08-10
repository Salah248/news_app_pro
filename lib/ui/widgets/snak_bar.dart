import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_pro/resources/color_manager.dart';
import 'package:news_app_pro/resources/style_manage.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: StyleManager.categoryTitle),
      backgroundColor: ColorManager.backgroundColor,
      behavior: SnackBarBehavior.floating,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      margin: EdgeInsets.all(16.h),
      duration: const Duration(seconds: 2),
    ),
  );
}
