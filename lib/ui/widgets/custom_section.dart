import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_pro/resources/style_manage.dart';

class CustomSection extends StatelessWidget {
  const CustomSection({
    super.key,
    this.title,
    this.subTitle,
    this.imageName,
    this.onTap,
  });
  final String? title;
  final String? subTitle;
  final String? imageName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minTileHeight: 80.h,
      titleAlignment: ListTileTitleAlignment.top,
      onTap: onTap,
      trailing: Container(
        width: 100.w,
        height: 80.h,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
        child: Image.asset(
          width: 100.w,
          height: 80.h,
          imageName ?? 'asset/images/test_ui.png',
          fit: BoxFit.cover,
        ),
      ),
      minLeadingWidth: 0,
      title: Text(title ?? '', style: StyleManager.bodyTitle, maxLines: 2),
      subtitle: Text(subTitle ?? '', style: StyleManager.bodySubTitle),
    );
  }
}
