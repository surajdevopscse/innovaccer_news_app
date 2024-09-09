import 'dart:async';

class SplashUseCase {
  Future<void> execute(void Function() callback) async {
    Timer(const Duration(seconds: 2), callback);
  }
}
