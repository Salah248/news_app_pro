import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_pro/cubit/news_cubit.dart';
import 'package:news_app_pro/resources/color_manager.dart';
import 'package:news_app_pro/resources/constants.dart';
import 'package:news_app_pro/resources/routes_manager.dart';
import 'package:news_app_pro/resources/string_manager.dart';
import 'package:news_app_pro/resources/style_manage.dart';
import 'package:news_app_pro/ui/widgets/custom_cahed_network_image.dart';
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
  void initState() {
    super.initState();
    context.read<NewsCubit>().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 32.w,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.language, color: ColorManager.primaryColor),
          onPressed: () {
            if (context.locale.languageCode == 'en') {
              context.setLocale(const Locale('ar'));
            } else {
              context.setLocale(const Locale('en'));
            }
            setState(() {
              Constants.languageCode = context.locale.languageCode;
            });
            context.read<NewsCubit>().getNews(category: _selectedCategory);
          },
        ),
        actions: [
          IconButton(
            onPressed: () => context.push(Routes.search),
            icon: const Icon(Icons.search, color: ColorManager.primaryColor),
          ),
          SizedBox(width: 20.w),
        ],
        backgroundColor: const Color(0xffE9EEFA),
        title: Text(AppStrings.explore.tr(), style: StyleManager.heading),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
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
                _customCategory(title: AppStrings.travel.tr()),
                SizedBox(width: 12.w),
                _customCategory(title: AppStrings.technology.tr()),
                SizedBox(width: 12.w),
                _customCategory(title: AppStrings.business.tr()),
                SizedBox(width: 12.w),
                _customCategory(title: AppStrings.entertainment.tr()),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              //      final news = context.read<NewsCubit>();
              if (state is NewsLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primaryColor,
                  ),
                );
              }
              if (state is NewsSuccess) {
                final article = state.response!.articles;
                return Expanded(
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
                              child: CustomCachedNetworkImage(
                                imageUrl: article!.first.urlToImage!,
                              ),
                            ),
                            Text(
                              article.first.title ?? 'News Title',
                              style: StyleManager.bodyTitle,
                              maxLines: 2,
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: article.first.author ?? ''),
                                  const TextSpan(text: ' · '),
                                  TextSpan(
                                    text: DateFormat('MMM d, yyyy').format(
                                      DateTime.parse(
                                        article.first.publishedAt ??
                                            DateTime.now().toString(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              style: StyleManager.bodySubTitle,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: (article.length <= 12) ? article.length : 12,
                        itemBuilder: (context, index) {
                          return CustomSection(
                            title: article[index].title ?? '',
                            subTitle: article[index].author ?? '',
                            imageName: article[index].urlToImage ?? '',
                            createdAt: article[index].publishedAt,
                            article: article[index],
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
              if (state is NewsError) {
                return Center(child: Text(state.message));
              }
              return Center(
                child: Text('Loading...', style: StyleManager.bodyTitle),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _customCategory({String? title}) {
    final bool isSelected = _selectedCategory == title;
    return InkWell(
      onTap: () => {
        setState(() {
          _selectedCategory = title;
        }),
        context.read<NewsCubit>().getNews(
          category: _selectedCategory!.toLowerCase(),
        ),
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
