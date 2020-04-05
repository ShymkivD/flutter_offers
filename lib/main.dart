import 'package:flutter/material.dart';
import 'package:flutter_offers/custom_routes.dart';
import 'package:flutter_offers/services/auth.dart';
import 'package:flutter_offers/ui/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
        fontFamily: "GoogleSans",
        primaryColor: Color(0xFF02AD58),
        iconTheme: IconThemeData(color: Colors.white));

    return StreamProvider.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Flutter Offers',
        debugShowCheckedModeBanner: false,
        theme: theme,
        onGenerateRoute: CustomRoutes.generateRoute,
//        home: Wrapper(),
        initialRoute: CustomRoutes.HOME_PAGE,
      ),
    );
  }
}
