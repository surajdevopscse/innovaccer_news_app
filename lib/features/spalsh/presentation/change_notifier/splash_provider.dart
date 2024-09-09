// data/viewmodels/splash_view_model.dart
import 'package:flutter/material.dart';
import 'package:innovaccer_news_app/features/spalsh/domain/use_cases/splash_use_case.dart';

class SplashViewModel extends ChangeNotifier {
  final SplashUseCase _splashUseCase;

  SplashViewModel(this._splashUseCase);

  void startSplash(void Function() callback) {
    _splashUseCase.execute(callback);
  }
}
