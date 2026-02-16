import 'package:commssion_calculator/injection.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/app_colors.dart';
import 'core/navigation/app_router.dart';
import 'features/home/presentation/viewmodel/cubits/home_cubit.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<HomeCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: AppRouter.router, 
            debugShowCheckedModeBanner: false,
            title: 'Commission Calculator',
            theme: ThemeData(useMaterial3: true, colorSchemeSeed: AppColors.primaryBlue),
          );
        },
      ),
    );
  }
}