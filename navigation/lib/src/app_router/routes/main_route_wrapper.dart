import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:screen_main/screen_main.dart';

@RoutePage()
class MainRouteWrapper extends StatelessWidget{
  const MainRouteWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenMain();
  }
}