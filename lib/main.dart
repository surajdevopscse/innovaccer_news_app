import 'package:flutter/material.dart';
import 'package:innovaccer_news_app/config/theme/app_theme.dart';
import 'package:innovaccer_news_app/config/theme/theme_notifier.dart';
import 'package:innovaccer_news_app/core/api/api_services.dart';
import 'package:innovaccer_news_app/core/constants/constants.dart';
import 'package:innovaccer_news_app/core/resources/network_info.dart';
import 'package:innovaccer_news_app/core/utils/size_config.dart';
import 'package:innovaccer_news_app/features/news/data/data_sources/local/news_local_datasources.dart';
import 'package:innovaccer_news_app/features/news/data/data_sources/remote/news_remote_datasource.dart';
import 'package:innovaccer_news_app/features/news/data/repositories/news_repository_impl.dart';

import 'package:innovaccer_news_app/features/news/domain/usecases/news_usecases.dart';
import 'package:innovaccer_news_app/features/news/presenatation/provider/news_provider.dart';
import 'package:innovaccer_news_app/features/spalsh/domain/use_cases/splash_use_case.dart';
import 'package:innovaccer_news_app/features/spalsh/presentation/change_notifier/splash_provider.dart';
import 'package:innovaccer_news_app/features/spalsh/presentation/view/splash_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SplashViewModel(SplashUseCase()),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NewsProvider(
            NewsUseCases(
              newsRepository: NewsRepositoryImpl(
                newsRemoteDataSource: NewsRemoteDataSourceImpl(
                  services: ApiService(),
                ),
                newsLocalDataSource: NewsLocalDataSource(sharedPreferences),
                networkInfo: NetworkInfo(),
              ),
            ),
          ),
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
