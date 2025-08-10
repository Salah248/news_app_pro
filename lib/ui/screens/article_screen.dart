import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_pro/resources/color_manager.dart';
import 'package:news_app_pro/resources/style_manage.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

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
              Text(
                'Apple Unveils Revolutionary AI Features',
                style: StyleManager.bodyTitle,
              ),
              SizedBox(height: 16.h),
              Text(
                'Abdallah Yassein · Apr 12, 2023',
                style: StyleManager.bodySubTitle,
              ),
              SizedBox(height: 24.h),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla et dictum interdum, nisi lorem egestas odio, vitae scelerisque enim ligula venenatis dolor. Maecenas nisl est, ultrices nec congue eget, auctor vitae massa. Fusce luctus vestibulum augue ut aliquet. Mauris ante ligula, facilisis sed ornare eu, lobortis in odio. Praesent convallis urna a lacus interdum ut hendrerit risus congue. Nunc sagittis dictum nisi, sed ullamcorper ipsum dignissim ac. In at libero sed nunc venenatis imperdiet sed ornare turpis. Donec vitae dui eget tellus gravida venenatis. Integer fringilla congue eros non fermentum. Sed dapibus pulvinar nibh tempor porta.',
                style: StyleManager.articleBody,
              ),
              SizedBox(height: 24.h),
              Text(
                style: StyleManager.articleBody.copyWith(
                  fontSize: 16.sp,
                  color: ColorManager.secondaryColor,
                ),
                'One of the key advantages of remote work is its flexibility. Remote workers can often set their own schedules, allowing them to work when they are most productive and take breaks when needed. This can be especially beneficial for those with family or other commitments that require them to work non-traditional hours.Another advantage of remote work is its potential to increase productivity. Without the distractions of a busy office environment, many remote workers find that they are able to focus more easily on their work and complete tasks more efficiently. Additionally, remote work eliminates the need for commuting, which can save workers valuable time and reduce stress.',
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: 316.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/images/Image.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
