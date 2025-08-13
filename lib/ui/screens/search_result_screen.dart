import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_pro/data/model/news_model.dart';
import 'package:news_app_pro/resources/color_manager.dart';
import 'package:news_app_pro/resources/string_manager.dart';
import 'package:news_app_pro/resources/style_manage.dart';
import 'package:news_app_pro/ui/widgets/custom_section.dart';

class SearchResultScreen extends StatelessWidget {
  final List<Articles>? result;

  const SearchResultScreen({super.key, this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.searchResult.tr(),
          style: StyleManager.heading.copyWith(fontSize: 18.sp),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back, color: ColorManager.primaryColor),
        ),
      ),
      body: result == null || result!.isEmpty
          ? Center(child: Text(AppStrings.noResults.tr()))
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 32.r),
              itemCount: result!.length,
              itemBuilder: (context, index) {
                final article = result![index];
                return Padding(
                  padding: EdgeInsets.only(top: 24.r),
                  child: CustomSection(
                    title: article.title ?? '',
                    subTitle: article.author ?? 'Unknown',
                    createdAt: article.publishedAt ?? 'Unknown',
                    imageName: article.urlToImage ?? 'asset/images/test_ui.png',
                    article: article,
                  ),
                );
              },
            ),
    );
  }
}
