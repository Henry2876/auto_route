import 'package:flutter/material.dart';
import 'package:screen_account/screen_account.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Study App',
      home: const ScreenAccount(), // ← Главный экран
      debugShowCheckedModeBanner: false,
    );
  }
}
