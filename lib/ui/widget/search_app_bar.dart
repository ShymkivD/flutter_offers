import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final TabController tabController;
  SearchAppBar(this.tabController);
  @override
  _SearchAppBarState createState() => _SearchAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(104.0);
}

class _SearchAppBarState extends State<SearchAppBar> {
  Widget appBarTitle;
  Icon actionIcon = Icon(Icons.search);

  @override
  void initState() {
    super.initState();
    appBarTitle = Text('App name');
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: IconButton(
            icon: Image.asset(
              'assets/images/menu.png',
              scale: 2.6,
            ),
            onPressed: () {},
          )),
      title: appBarTitle,
      actions: <Widget>[
        IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (actionIcon.icon == Icons.search) {
                  actionIcon = Icon(Icons.close);
                  appBarTitle = TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  );
                } else {
                  actionIcon = Icon(Icons.search);
                  appBarTitle = Text('Корпоратив');
                }
              });
            }),
        IconButton(
          icon: Image.asset(
            'assets/images/info.png',
            scale: 2.6,
          ),
          onPressed: () {},
        ),
      ],
      bottom: TabBar(
        unselectedLabelColor: Colors.white.withOpacity(0.56),
        labelColor: Colors.white,
        tabs: [Tab(text: 'Предложения'), Tab(text: 'Компании')],
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: Colors.white),
            insets: EdgeInsets.symmetric(horizontal: 12.0)),
        controller: widget.tabController,
      ),
    );
  }
}
