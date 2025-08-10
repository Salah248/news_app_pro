import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_pro/resources/color_manager.dart';
import 'package:news_app_pro/resources/style_manage.dart';
import 'package:news_app_pro/ui/widgets/custom_section.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Search Result',
          style: StyleManager.heading.copyWith(fontSize: 18.sp),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back, color: ColorManager.primaryColor),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 32.r),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 24.r),
            child: const CustomSection(
              title: 'Apple Unveils Revolutionary AI Features ',
              subTitle: 'Abdallah - May 3, 2023',
              imageName: 'asset/images/test_ui.png',
            ),
          );
        },
      ),
    );
  }
}
