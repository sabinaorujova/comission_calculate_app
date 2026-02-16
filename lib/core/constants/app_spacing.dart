import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpacing {
  static EdgeInsets get pagePadding => EdgeInsets.all(16.r);
  static EdgeInsets get cardPadding => EdgeInsets.all(12.r);
  static EdgeInsets get errorPadding => EdgeInsets.all(32.r);
  static EdgeInsets get badgePadding =>
      EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h);
  static EdgeInsets get cardBottomMargin => EdgeInsets.only(bottom: 12.h);
  static EdgeInsets get appBarTitlePadding =>
      EdgeInsets.only(left: 20.w, bottom: 16.h);
  static EdgeInsets get transactionCardPadding =>
      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h);
}
