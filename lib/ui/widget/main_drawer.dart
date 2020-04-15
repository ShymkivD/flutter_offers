import 'package:flutter/material.dart';
import 'package:flutter_offers/custom_routes.dart';
import 'package:flutter_offers/services/auth.dart';
import 'package:flutter_offers/ui/widget/red_material_button.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomCenter,
          colors: [
            Color(0xFF27C189),
            Color(0xFF237BBF),
          ],
        )),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 25.0, 0.0, 15.0),
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/clutchLogo.png',
                  scale: 3.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    DrawerListTile(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(
                              context, CustomRoutes.EDIT_PROFILE);
                        },
                        leading: Icon(
                          Icons.person,
                          color: Colors.white70,
                        ),
                        title: 'Профиль'),
                    DrawerListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.location_on,
                          color: Colors.white70,
                        ),
                        title: 'Позиции'),
                    DrawerListTile(
                        onTap: () {},
                        leading: Image.asset(
                          'assets/images/barCode.png',
                          scale: 2.6,
                        ),
                        title: 'Корпоратка'),
                    DrawerListTile(
                        onTap: () {},
                        leading: Image.asset(
                          'assets/images/transaction.png',
                          scale: 2.3,
                        ),
                        title: 'Транзакции'),
                    DrawerListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.settings,
                          color: Colors.white70,
                        ),
                        title: 'Настройка'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: RedMaterialButton(
                  title: 'Добавить карту',
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset(
                        'assets/images/shareButton.png',
                        scale: 3.0,
                      ),
                      onTap: () {},
                    ),
                    GestureDetector(
                      child: Image.asset(
                        'assets/images/logOutButton.png',
                        scale: 3.0,
                      ),
                      onTap: () async {
                        await _auth.signOut();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final GestureTapCallback onTap;

  DrawerListTile({this.leading, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: ListTile(
            leading: leading,
            title: Text(
              title,
              style:
                  TextStyle(color: Colors.white70, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
