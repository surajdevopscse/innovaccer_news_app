import 'package:flutter/material.dart';
import 'package:innovaccer_news_app/config/theme/app_theme.dart';
import 'package:innovaccer_news_app/config/theme/theme_notifier.dart';
import 'package:innovaccer_news_app/core/constants/constants.dart';
import 'package:innovaccer_news_app/core/utils/size_config.dart';
import 'package:innovaccer_news_app/features/spalsh/domain/use_cases/splash_use_case.dart';
import 'package:innovaccer_news_app/features/spalsh/presentation/change_notifier/splash_provider.dart';
import 'package:innovaccer_news_app/features/spalsh/presentation/view/splash_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SplashViewModel(SplashUseCase()),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: const InnoApp(),
    ),
  );
}

class InnoApp extends StatelessWidget {
  const InnoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.APPTITLE,
      themeMode: themeProvider.themeMode, // Use theme mode from provider
      theme: AppTheme.lightTheme, // Light theme data
      darkTheme: AppTheme.darkTheme, // Dark theme data
      home: Builder(
        builder: (context) {
          SizeConfig.init(context); // Initialize size config
          return const SplashWrapper();
        },
      ),
    );
  }
}
