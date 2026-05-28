import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/route_paths.dart';
import '../../../../core/di/injection.dart';

import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() =>
      _LoginPageState();
}

class _LoginPageState
    extends State<LoginPage> {
  final usernameController =
  TextEditingController();

  final passwordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: BlocListener<
            LoginCubit,
            LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              context.go(
                RoutePaths.dashboard,
              );
            }

            if (state is LoginFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(
                SnackBar(
                  content:
                  Text(state.message),
                ),
              );
            }
          },
          child: Padding(
            padding:
            const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller:
                  usernameController,
                  decoration:
                  const InputDecoration(
                    labelText:
                    'Username',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller:
                  passwordController,
                  obscureText: true,
                  decoration:
                  const InputDecoration(
                    labelText:
                    'Password',
                  ),
                ),
                const SizedBox(height: 24),
                BlocBuilder<
                    LoginCubit,
                    LoginState>(
                  builder:
                      (context, state) {
                    final isLoading =
                    state
                    is LoginLoading;

                    return ElevatedButton(
                      onPressed:
                      isLoading
                          ? null
                          : () {
                        context
                            .read<
                            LoginCubit>()
                            .login(
                          username:
                          usernameController
                              .text,
                          password:
                          passwordController
                              .text,
                        );
                      },
                      child:
                      isLoading
                          ? const CircularProgressIndicator()
                          : const Text(
                        'Login',
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}