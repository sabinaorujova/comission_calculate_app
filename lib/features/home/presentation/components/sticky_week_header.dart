import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

class StickyWeekHeader extends StatelessWidget {
  final String title;
  const StickyWeekHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      width: double.infinity,
      color: AppColors.scaffoldBg, 
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlue,
              fontSize: 14.sp,
            ),
          ),
          Icon(Icons.calendar_month, size: 16.sp, color: AppColors.grey),
        ],
      ),
    );
  }
}