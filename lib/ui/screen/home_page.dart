import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_offers/ui/widget/companies_tab.dart';
import 'package:flutter_offers/ui/widget/offers_tab.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: Padding(
            padding: EdgeInsets.only(left: 12),
            child: IconButton(
              icon: SvgPicture.asset('assets/images/back.svg'),
              onPressed: () {},
            )),
        title: Row(children: <Widget>[
          Text('Корпоратив'),
        ]),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset('assets/images/info.svg'),
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
          controller: _tabController,
        ),
      ),
      backgroundColor: Colors.white,
      body: TabBarView(
        children: [OffersTab(), CompaniesTab()],
        controller: _tabController,
      ),
    );
  }
}
