import 'package:authorization_screen/src/bloc/authorization_bloc.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthorizationBloc(appRouter: appLocator.get<AppRouter>()),

      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocListener<AuthorizationBloc, AuthorizationState>(
          listener: (context, state) {
            ScaffoldMessenger.of(context).clearSnackBars();
            if (state.status == AuthorizationStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? LocaleKeys.mainPage_authorizationScreen_error.tr()),
                  backgroundColor: Colors.red,
                  duration: const Duration(seconds: 2),
                ),
              );
            }
            ;
          },
          child: BlocBuilder<AuthorizationBloc, AuthorizationState>(
            builder: (context, state) {
              final isLoading = state.status == AuthorizationStatus.loading;

              return Column(
                children: [
                  Expanded(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      child: Text(
                        LocaleKeys.appName.tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 60,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextField(
                            onChanged: (value) {
                              context.read<AuthorizationBloc>().add(
                                EmailChangedEvent(value),
                              );
                            },
                            decoration: InputDecoration(
                              hintText: LocaleKeys.mainPage_authorizationScreen_email.tr(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 15),
                          TextField(
                            onChanged: (value) {
                              context.read<AuthorizationBloc>().add(
                                PasswordChangedEvent(value),
                              );
                            },
                            decoration: InputDecoration(
                              hintText: LocaleKeys.mainPage_authorizationScreen_password.tr(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.all(24),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: isLoading
                            ? null
                            : () {
                                context.read<AuthorizationBloc>().add(
                                  LoginSubmittedEvent(),
                                );
                              },
                        child: isLoading
                            ? CircularProgressIndicator()
                            : Text(
                                LocaleKeys.mainPage_authorizationScreen_login.tr(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
