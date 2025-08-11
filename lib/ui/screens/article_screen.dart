import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_pro/data/model/news_model.dart';
import 'package:news_app_pro/resources/color_manager.dart';
import 'package:news_app_pro/resources/style_manage.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key, this.article});
  final Articles? article;

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 600.h,
        width: double.infinity,
        padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 24.h),
        decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.r),
            topRight: Radius.circular(32.r),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.article!.title ?? '', style: StyleManager.bodyTitle),
              SizedBox(height: 16.h),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: widget.article!.author ?? ''),
                    const TextSpan(text: ' · '),
                    TextSpan(
                      text: DateFormat('MMM d, yyyy').format(
                        DateTime.parse(widget.article!.publishedAt ?? ''),
                      ),
                    ),
                  ],
                ),
                style: StyleManager.bodySubTitle,
              ),
              SizedBox(height: 24.h),
              Text(
                widget.article!.content ?? '',
                style: StyleManager.articleBody,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 24.h),
              Text(
                widget.article!.description ?? '',
                style: StyleManager.articleBody.copyWith(
                  fontSize: 16.sp,
                  color: ColorManager.secondaryColor,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: 316.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.article!.urlToImage ?? ''),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
