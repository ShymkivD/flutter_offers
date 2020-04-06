import 'package:flutter/material.dart';
import 'package:flutter_offers/ui/page/company_page.dart';
import 'package:flutter_offers/ui/page/edit_profile_page.dart';
import 'package:flutter_offers/ui/page/home_page.dart';

class CustomRoutes {
  static const HOME_PAGE = '/';
  static const PROFILE = '/profile';
  static const EDIT_PROFILE = '/edit_profile';
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
      case EDIT_PROFILE:
        screen = EditProfilePage();
        break;
      case COMPANY_PAGE:
        screen = CompanyPage(args);
        break;
    }
//    return MaterialPageRoute(builder: (_) => screen);
    return CustomMaterialRouter(builder: (_) => screen);
  }
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
