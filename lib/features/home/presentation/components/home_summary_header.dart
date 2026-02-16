import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import 'stat_chip.dart';

class HomeSummaryHeader extends StatelessWidget {
  final double totalFee;
  final int transactionCount;

  const HomeSummaryHeader({super.key, required this.totalFee, required this.transactionCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primaryBlue, AppColors.primaryBlue.withOpacity(0.85)],
        ),
      ),
      child: Stack(
        children: [
          _buildBackgroundCircle(),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 70.h, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(AppStrings.totalRevenue, style: TextStyle(color: Colors.white70)),
                8.verticalSpace,
                Text(
                  "${totalFee.toStringAsFixed(2)} EUR",
                  style: TextStyle(color: AppColors.white, fontSize: 34.sp, fontWeight: FontWeight.w900),
                ),
                20.verticalSpace,
                Row(
                  children: [
                    StatChip(icon: Icons.compare_arrows, label: "$transactionCount ${AppStrings.transactionsCount}"),
                    12.horizontalSpace,
                    const StatChip(icon: Icons.currency_exchange, label: AppStrings.baseCurrency),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundCircle() => Positioned(
        right: -30.w,
        top: -20.h,
        child: CircleAvatar(radius: 80.r, backgroundColor: Colors.white.withOpacity(0.05)),
      );
}