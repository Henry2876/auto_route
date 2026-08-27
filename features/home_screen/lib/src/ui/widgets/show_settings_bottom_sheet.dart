import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_screen/src/bloc/home_bloc.dart';

class ShowSettingsBottomSheet extends StatelessWidget {
  final HomeEvent logout ;
  const ShowSettingsBottomSheet({super.key, required this.logout});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.settings),
      onSelected: (value) {
        switch (value) {
          case 'account':
            break;
          case 'about':
            break;
          case 'logout':
            context.read<HomeBloc>().add(logout);
            break;
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'account',
          child: Row(
            children: [
              Icon(Icons.account_circle),
              SizedBox(width: 12),
              Text('Аккаунт'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'about',
          child: Row(
            children: [
              Icon(Icons.info),
              SizedBox(width: 12),
              Text('О приложении'),
            ],
          ),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem(
          value: 'logout',
          child: Row(
            children: [
              Icon(Icons.exit_to_app, color: Colors.red),
              SizedBox(width: 12),
              Text('Выход', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ],
    );
  }

}
