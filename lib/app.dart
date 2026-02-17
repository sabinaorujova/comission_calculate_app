import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/constants/app_colors.dart';
import 'core/navigation/app_router.dart';

class CommissionCalculatorApp extends StatelessWidget {
  const CommissionCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), 
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Commission Calculator',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.scaffoldBg,
            useMaterial3: true,
          ),
          routerConfig: AppRouter.router,  
        );
      },
    );
  }
}