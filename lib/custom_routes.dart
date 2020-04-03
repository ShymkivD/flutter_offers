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
//    return MaterialPageRoute(builder: (_) => screen);
    return CustomMaterialRouter(builder: (_) => screen);
//    return ScaleRoute(page: screen);
  }
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}

class CustomMaterialRouter extends MaterialPageRoute {
  CustomMaterialRouter({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 650);

  @override
  Widget buildTransitions(BuildContext context, Animation animation,
      Animation secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) {
      return child;
    }
    return FadeTransition(opacity: animation, child: child);
  }
}
