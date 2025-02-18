import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newss_app/core/cubit/app_bloc_observer.dart';
import 'package:newss_app/core/cubit/main_cubit/main_cubit.dart';
import 'package:newss_app/core/routing/app_router.dart';
import 'package:newss_app/core/theme/app_theme.dart';
import 'core/routing/routes.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<MainCubit>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.splash,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }
}
