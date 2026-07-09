import 'package:authorization_screen/authorization_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthorizationRouteWrapper extends StatelessWidget {
  const AuthorizationRouteWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthorizationScreen();
  }
}
