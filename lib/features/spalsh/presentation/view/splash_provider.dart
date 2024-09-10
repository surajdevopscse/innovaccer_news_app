import 'package:flutter/material.dart';
import 'package:innovaccer_news_app/features/news/presenatation/view/news_page.dart';
import 'package:innovaccer_news_app/features/spalsh/presentation/change_notifier/splash_provider.dart';
import 'package:innovaccer_news_app/features/spalsh/presentation/widgets/splash_screen.dart';
import 'package:provider/provider.dart';

class SplashWrapper extends StatelessWidget {
  const SplashWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final splashViewModel =
        Provider.of<SplashViewModel>(context, listen: false);

    //Will Replace and Pull to Home Page
    splashViewModel.startSplash(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NewsScreen()),
      );
    });

    return const SplashScreen();
  }
}
