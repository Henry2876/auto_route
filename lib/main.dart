import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:study_auto_router_1/app/fi_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  appDI.initDependencies();

  runApp(EasyLocalization(
      path: 'assets/translations',
      supportedLocales: [
        Locale('en'),
        Locale('es'),
        Locale('ja'),
        Locale('ru'),
        Locale('zh'),
      ],
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: FiApp()));
}
