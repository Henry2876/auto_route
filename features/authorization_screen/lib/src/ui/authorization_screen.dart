import 'package:authorization_screen/src/bloc/authorization_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthorizationBloc(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocConsumer<AuthorizationBloc, AuthorizationState>(
          listener: (context, state) {
            if (state.status == AuthorizationStatus.success) {
              context.router.replace(const HomeRoute());
            }
            if (state.status == AuthorizationStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? 'Ошибка'),
                  backgroundColor: Colors.red,
                ),
              );
            }
            ;
          },
          builder: (context, state) {
            final isLoading = state.status == AuthorizationStatus.loading;

            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    child: Text(
                      'FI',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 60,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,

                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (value) {
                            context.read<AuthorizationBloc>().add(
                              EmailChanged(value),
                            );
                          },
                          decoration: InputDecoration(
                            hintText: 'Email',
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
                              PasswordChanged(value),
                            );
                          },
                          decoration: InputDecoration(
                            hintText: 'Password',
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
                      onPressed:
                        isLoading
                            ? null
                            : () {
                                context.read<AuthorizationBloc>().add(
                                  LoginSubmitted(),
                                );
                              },
                      child: isLoading
                          ? CircularProgressIndicator()
                          : Text(
                              'Войти',
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
    );
  }
}
