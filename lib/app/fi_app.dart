import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class FiApp extends StatelessWidget {
  final appRouter = AppRouter();

  FiApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = appLocator.get<AppRouter>();
    return MaterialApp.router(
      supportedLocales: context.supportedLocales,
      routerConfig: appRouter.config(),
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      title: 'FI App',
      debugShowCheckedModeBanner: false,
    );
  }
}
