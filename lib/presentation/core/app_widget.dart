import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd/application/auth/auth_bloc.dart';
import 'package:flutter_ddd/injection.dart';
import 'package:flutter_ddd/presentation/routes/router.dart' as AppRouter;

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = AppRouter.Router();
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => getIt<AuthBloc>())],
      child: MaterialApp.router(
        title: 'Notes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.green[800],
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.red, // Your accent color
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.blue[900],
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        routeInformationParser: router.defaultRouteParser(),
        //routerDelegate: router.delegate()
        routerDelegate: AutoRouterDelegate(router),
      ),
    );
  }
}
