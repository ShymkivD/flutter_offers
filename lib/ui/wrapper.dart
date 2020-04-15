import 'package:flutter/material.dart';
import 'package:flutter_offers/models/user.dart';
import 'package:flutter_offers/ui/authenticate/authenticate.dart';
import 'package:flutter_offers/ui/page/home_page.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    print('user ' + (user?.uid ?? 'not authorized'));
    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return HomePage();
    }
  }
}
