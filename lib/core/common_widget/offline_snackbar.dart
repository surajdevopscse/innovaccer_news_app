import 'package:flutter/material.dart';

void showOfflineSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.signal_wifi_off, size: 80, color: Colors.white),
            SizedBox(height: 20),
            Text(
              'You are offline! Check your internet connection.',
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
    ),
  );
}
