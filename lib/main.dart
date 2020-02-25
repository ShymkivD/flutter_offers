import 'package:flutter/material.dart';
import 'package:flutter_offers/ui/screen/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      fontFamily: "GoogleSans",
      primaryColor: Color(0xFF02AD58),
    );

    return MaterialApp(
      title: 'Flutter Offers',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: HomePage(),
    );
  }
}