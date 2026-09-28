import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

void main() {
  appDI.initDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     final appRouter = appLocator.get<AppRouter>();
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      title: 'Study App',
      debugShowCheckedModeBanner: false,
    );
  }
}
