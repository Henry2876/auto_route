import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:screen_account/screen_account.dart';


@RoutePage()
class AccountRouteWrapper extends StatelessWidget{
  const AccountRouteWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenAccount();
  }
}