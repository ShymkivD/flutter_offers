import 'package:flutter/material.dart';
import 'package:flutter_offers/ui/page/company_page.dart';
import 'package:flutter_offers/ui/page/home_page.dart';

class CustomRoutes {
  static const HOME_PAGE = '/';
  static const PROFILE = '/profile';
  static const COMPANY_PAGE = '/company';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget screen;
    final args = settings.arguments;
    switch (settings.name) {
      case HOME_PAGE:
        screen = HomePage();
        break;
      case PROFILE:
        screen = Container();
        break;
      case COMPANY_PAGE:
        screen = CompanyPage(args);
        break;
    }
    return MaterialPageRoute(builder: (_) => screen);
  }
}
