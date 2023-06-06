import 'package:flutter/material.dart';
import 'package:news_app/Core/Resources/string_manager.dart';
import 'package:news_app/Core/Routes/pages_route_name.dart';

import 'pages.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutesName.firstViewRoute:
        return MaterialPageRoute(builder: (_) => const FirstView());
      case PagesRoutesName.secondViewRoute:
        return MaterialPageRoute(builder: (_) => const SecondView());
      // case PagesRoutesName.thirdViewRoute:
      //   return MaterialPageRoute(builder: (_) => ThirdView());
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
      ),
    );
  }
}
