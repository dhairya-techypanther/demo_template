import 'package:demo_template/Routing/RouteNames.dart';
import 'package:demo_template/UI/Pages/AddUser.dart';
import 'package:demo_template/UI/Pages/HomeViewPage.dart';
import 'package:demo_template/UI/Pages/LoginViewPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case loginViewRoute:
      return getPageRoutes(
        routeName: loginViewRoute,
        settings: settings,
        page: () => const LoginViewPage(),
      );

    case homeViewRoute:
      return getPageRoutes(
        routeName: homeViewRoute,
        settings: settings,
        page: () => const HomeViewPage(),
      );

    case addUserRoute:
      return getPageRoutes(
        routeName: addUserRoute,
        settings: settings,
        page: () => const AddUserPage(),
      );

    default:
      return GetPageRoute(
        page: () => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

/// Use This Method To Call Pages
PageRoute getPageRoutes(
    {required String routeName,
    required Function page,
    required RouteSettings settings}) {
  return GetPageRoute(
    page: () => page(),
    // transition: Transition.rightToLeft,
    routeName: routeName,
    settings: settings,
  );
}
