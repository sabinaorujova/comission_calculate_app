import 'package:commssion_calculator/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/extensions/transaction_grouping_extension.dart';
import '../../../../core/common_widgets/shimmer.dart';
import '../../domain/entities/comission_result.dart';
import '../components/error_view.dart';
import '../components/home_summary_header.dart';
import '../components/sticky_week_header.dart';
import '../components/transaction_item_card.dart';
import '../viewmodel/cubits/home_cubit.dart';
import '../viewmodel/cubits/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return switch (state) {
            HomeLoading() || HomeInitial() => const ShimmerLoading(),
            HomeError() => const HomeErrorView(),
            HomeLoaded() => _TransactionSliverContent(results: state.results),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}

class _TransactionSliverContent extends StatelessWidget {
  final List<CommissionResult> results;
  const _TransactionSliverContent({required this.results});

  @override
  Widget build(BuildContext context) {
    final groupedResults = results.groupByWeek();
    final totalFee =
        results.fold<double>(0, (sum, item) => sum + item.commission);

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          expandedHeight: 240.h,
          pinned: true,
          stretch: true,
          backgroundColor: AppColors.primaryBlue,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            titlePadding: AppSpacing.appBarTitlePadding,
            title: const Text(
              AppStrings.appBarTitle,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            background: HomeSummaryHeader(
              totalFee: totalFee,
              transactionCount: results.length,
            ),
          ),
        ),
        ...groupedResults.entries.map((entry) {
          return SliverStickyHeader(
            header: StickyWeekHeader(title: entry.key),
            sliver: SliverPadding(
              padding: AppSpacing.transactionCardPadding,
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = entry.value[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: TransactionItemCard(
                        transaction: item.transaction,
                        commission: item.commission,
                      ),
                    );
                  },
                  childCount: entry.value.length,
                ),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}
