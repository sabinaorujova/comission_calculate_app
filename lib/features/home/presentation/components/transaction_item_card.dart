import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../domain/entities/transaction_entity.dart';


class TransactionItemCard extends StatelessWidget {
  final TransactionEntity transaction;
  final double commission;

  const TransactionItemCard({
    super.key,
    required this.transaction,
    required this.commission,
  });

  @override
  Widget build(BuildContext context) {
    final isDeposit = transaction.operationType.name == 'deposit';
    final dateFormatter = DateFormat('dd MMM yyyy');

    final decimalDigits = transaction.currency == 'JPY' ? 0 : 2;
    final currencyFormat = NumberFormat.currency(symbol: '', decimalDigits: decimalDigits);

    final statusColor = isDeposit ? AppColors.depositGreen : AppColors.withdrawRed;
    final statusIcon = isDeposit ? Icons.south_west_rounded : Icons.north_east_rounded;

    return Container(
      margin:AppSpacing.cardBottomMargin,
      padding: AppSpacing.cardPadding,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r), 
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.04),
            spreadRadius: 0,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 44.r,
            width: 44.r,
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Icon(statusIcon, color: statusColor, size: 20.r),
          ),
          12.horizontalSpace,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isDeposit ? "Deposit" : "Withdrawal",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15.sp,
                    color: AppColors.textDark,
                    letterSpacing: -0.3,
                  ),
                ),
                4.verticalSpace,
                Row(
                  children: [
                    Text(
                      transaction.userType.name.toUpperCase(),
                      style: TextStyle(
                        color: AppColors.textGrey,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      " • #${transaction.userId}",
                      style: TextStyle(
                        color: AppColors.textGrey.withOpacity(0.7),
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${isDeposit ? '+' : '-'}${currencyFormat.format(transaction.amount)} ${transaction.currency}",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15.sp,
                  color: AppColors.textDark,
                ),
              ),
              4.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.feeOrange.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  "Fee: ${currencyFormat.format(commission)}",
                  style: TextStyle(
                    color: AppColors.feeOrange,
                    fontWeight: FontWeight.w700,
                    fontSize: 10.sp,
                  ),
                ),
              ),
              6.verticalSpace,
              Text(
                dateFormatter.format(transaction.date),
                style: TextStyle(
                  color: AppColors.textGrey.withOpacity(0.8),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}