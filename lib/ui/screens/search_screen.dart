import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_pro/resources/style_manage.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 48.h,
          margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: TextField(
                  cursorHeight: 25.h,
                  controller: _searchController,
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      iconSize: 24.sp,
                      padding: EdgeInsets.zero,
                      splashRadius: 1,
                      onPressed: () {},
                      icon: Icon(Icons.search, color: Colors.grey.shade500),
                    ),
                    suffixIcon: IconButton(
                      iconSize: 24.sp,
                      padding: EdgeInsets.zero,
                      splashRadius: 1,
                      onPressed: () {
                        _searchController.clear();
                      },
                      icon: Icon(Icons.cancel, color: Colors.grey.shade500),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 4,
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: Colors.blue.shade500),
                    ),
                    border: OutlineInputBorder(
                      gapPadding: 4,
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: Colors.grey.shade200),
                    ),
                    enabledBorder: OutlineInputBorder(
                      gapPadding: 4,
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    hint: Text(
                      'Search',
                      style: StyleManager.bodySubTitle.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: GoogleFonts.schibstedGrotesk(
                    color: const Color(0xff0E0AB1),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
