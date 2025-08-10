import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_pro/resources/color_manager.dart';
import 'package:news_app_pro/resources/routes_manager.dart';
import 'package:news_app_pro/resources/style_manage.dart';
import 'package:news_app_pro/ui/widgets/custom_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color _color = Colors.transparent;
  String? _selectedCategory = 'Travel';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 32.w,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => context.push(Routes.search),
            icon: const Icon(Icons.search, color: ColorManager.primaryColor),
          ),
          SizedBox(width: 20.w),
        ],
        backgroundColor: const Color(0xffE9EEFA),
        title: Text('Explore', style: StyleManager.heading),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 16.h),
          SizedBox(
            height: 32.h,
            width: double.infinity,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              scrollDirection: Axis.horizontal,
              children: [
                _customCategory(title: 'Travel', onTap: () {}),
                SizedBox(width: 12.w),
                _customCategory(title: 'Technology', onTap: () {}),
                SizedBox(width: 12.w),
                _customCategory(title: 'Business', onTap: () {}),
                SizedBox(width: 12.w),
                _customCategory(title: 'Entertainment', onTap: () {}),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              shrinkWrap: true,
              children: [
                SizedBox(
                  width: 366.w,
                  height: 292.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 366.w,
                        height: 206.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Image.asset(
                          'asset/images/Image.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'Apple Unveils Revolutionary AI Features',
                        style: StyleManager.bodyTitle,
                      ),
                      Text(
                        'Salah . May 1, 2025',
                        style: StyleManager.bodySubTitle,
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) => CustomSection(
                    title: 'Apple Unveils Revolutionary AI Features',
                    subTitle: 'Salah . May 1, 2025',
                    onTap: () {
                      context.push(Routes.article);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _customCategory({String? title, void Function()? onTap}) {
    final bool isSelected = _selectedCategory == title;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedCategory = title; // حفظ الاختيار
        });
        onTap?.call();
      },
      borderRadius: BorderRadius.circular(56.r),
      child: Container(
        width: 120.w,
        height: 32.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? ColorManager.backgroundColor.withAlpha((255 * .9).round())
              : _color,
          borderRadius: BorderRadius.circular(56.r),
          border: Border.all(
            width: 1.w,
            color: ColorManager.secondaryColor.withAlpha((255 * .1).round()),
          ),
        ),
        child: Text(title ?? '', style: StyleManager.categoryTitle),
      ),
    );
  }
}
