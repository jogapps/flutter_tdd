import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd/application/auth/auth_bloc.dart';
import 'package:flutter_ddd/presentation/routes/router.dart';

class MySplashPage extends StatelessWidget {
  const MySplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(initial: (_) {
          print("Initial state");
          context.router.replace(const SignInRoute());
        }, authenticated: (_) {
          print("Authenticated state");
          context.router.replace(const SignInRoute());
        }, unauthenticated: (_) {
          print("Logged In state");
          context.router.replace(const SignInRoute());
        });
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
