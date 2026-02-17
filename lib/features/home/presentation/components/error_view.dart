import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';

class HomeErrorView extends StatelessWidget {

  const HomeErrorView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.errorImage,
              width: 250.w,
              fit: BoxFit.contain,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) return child;
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  child: child,
                );
              },
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.warning_amber_rounded,
                size: 80.r,
                color: AppColors.withdrawRed,
              ),
            ),
            24.verticalSpace,
            Text(
              AppStrings.errorOccurred,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            12.verticalSpace,
            Text(
              AppStrings.transactionLoadError,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
            ),
            32.verticalSpace,
           
          ],
        ),
      ),
    );
  }
}