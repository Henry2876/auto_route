import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_screen/home_screen.dart';


@RoutePage()
class HomeRouteWrapper extends StatelessWidget{
  const HomeRouteWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}