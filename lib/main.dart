import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart'; 
import 'injection.dart' as di;
import 'features/home/presentation/viewmodel/cubits/home_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<HomeCubit>()..loadAndCalculate(),
        ),
      ],
      child: const CommissionCalculatorApp(),
    ),
  );
}