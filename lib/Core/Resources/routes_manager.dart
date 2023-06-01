import 'package:flutter/material.dart';
import 'package:news_app/Core/Resources/string_manager.dart';

import 'pages.dart';

class Routes {
  static const String firstViewRoute = "/";
  static const String secondViewRoute = "/secondView";
  static const String thirdViewRoute = "/thirdView";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.firstViewRoute:
        return MaterialPageRoute(builder: (_) => const FirstView());
      case Routes.secondViewRoute:
        return MaterialPageRoute(builder: (_) => const SecondView());
      case Routes.thirdViewRoute:
        return MaterialPageRoute(builder: (_) => const ThirdView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(StringManager.noRouteFound),
              ),
              body: const Center(child: Text(StringManager.noRouteFound)),
            ));
  }
}
