import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_screen/src/bloc/home_bloc.dart';
import 'package:core/core.dart';

class ShowSettingsBottomSheet extends StatelessWidget {
  final HomeEvent logout;

  const ShowSettingsBottomSheet({
    super.key,
    required this.logout,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.settings),
      onSelected: (value) {
        switch (value) {
          case 'account':
            break;
          case 'localization':
            _showLanguageSelection(context);
            break;
          case 'about':
            break;
          case 'logout':
            context.read<HomeBloc>().add(logout);
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'account',
          child: Row(
            children: [
              const Icon(Icons.account_circle),
              const SizedBox(width: 12),
              Text(LocaleKeys.mainPage_homeScreen_account.tr()),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'localization',
          child: Row(
            children: [
              const Icon(Icons.language),
              const SizedBox(width: 12),
              Text(LocaleKeys.mainPage_homeScreen_language.tr()),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'about',
          child: Row(
            children: [
              const Icon(Icons.info),
              const SizedBox(width: 12),
              Text(LocaleKeys.mainPage_homeScreen_aboutApp.tr()),
            ],
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          value: 'logout',
          child: Row(
            children: [
              const Icon(Icons.exit_to_app, color: Colors.red),
              const SizedBox(width: 12),
              Text(
                LocaleKeys.mainPage_homeScreen_logOut.tr(),
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void _showLanguageSelection(BuildContext context) {
  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    isScrollControlled: false,
    builder: (context) => Column(
      children: [
        Center(
          child: Text(
            LocaleKeys.mainPage_homeScreen_listLanguage.tr(),
            style: TextStyle(fontSize: 20),
          ),
        ),
        ListTile(
          title: Text('Русский'),
          onTap: () async {
            await context.setLocale(Locale('ru'));
          },
        ),
        ListTile(
          title: Text('English'),
          onTap: () async {
            await context.setLocale(Locale('en'));
          },
        ),
        ListTile(
          title: Text('Español'),
          onTap: () async {
            await context.setLocale(Locale('es'));
          },
        ),
        ListTile(
          title: Text('日本語'),
          onTap: () async {
            await context.setLocale(Locale('zh'));
          },
        ),
        ListTile(
          title: Text('中国人'),
          onTap: () async {
            await context.setLocale(Locale('ja'));
          },
        ),
      ],
    ),
  );
}
