import 'package:auto_route/annotations.dart';
import 'package:flutter_ddd/presentation/sign_in/sign_in_page.dart';
import 'package:flutter_ddd/presentation/splash/splash_page.dart';

export 'package:auto_route/auto_route.dart';

export 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SignInPage),
    AutoRoute(page: MySplashPage, initial: true),
  ],
)
class $Router {}
