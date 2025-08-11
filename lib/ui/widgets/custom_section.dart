import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_pro/data/model/news_model.dart';
import 'package:news_app_pro/resources/routes_manager.dart';
import 'package:news_app_pro/resources/style_manage.dart';
import 'package:news_app_pro/ui/widgets/custom_cahed_network_image.dart';

class CustomSection extends StatelessWidget {
  const CustomSection({
    super.key,
    this.title,
    this.subTitle,
    this.imageName,
    this.createdAt,
    this.onTap,
    this.article,
  });
  final String? title;
  final String? subTitle;
  final String? createdAt;
  final String? imageName;
  final void Function()? onTap;
  final Articles? article;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minTileHeight: 80.h,
      titleAlignment: ListTileTitleAlignment.top,
      onTap: () {
        if (article == null) return;
        context.push(
          Routes.article,
          extra: article, // ✅ إرسال المقالة نفسها
        );
      },
      trailing: Container(
        width: 100.w,
        height: 80.h,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
        child: CustomCachedNetworkImage(imageUrl: imageName!),
      ),
      minLeadingWidth: 0,
      title: Text(title ?? '', style: StyleManager.bodyTitle, maxLines: 2),
      subtitle: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: subTitle ?? ''),
            const TextSpan(text: ' · '),
            TextSpan(
              text: DateFormat(
                'MMM d, yyyy',
              ).format(DateTime.parse(createdAt ?? DateTime.now().toString())),
            ),
          ],
        ),
        style: StyleManager.bodySubTitle,
      ),
    );
  }
}
