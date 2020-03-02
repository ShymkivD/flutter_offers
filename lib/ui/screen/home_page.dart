import 'package:flutter/material.dart';
import 'package:flutter_offers/ui/widget/companies_tab.dart';
import 'package:flutter_offers/ui/widget/offers_tab.dart';
import 'package:flutter_offers/ui/widget/search_app_bar.dart';

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
      appBar: SearchAppBar(_tabController),
      backgroundColor: Colors.white,
      body: TabBarView(
        children: [OffersTab(), CompaniesTab()],
        controller: _tabController,
      ),
    );
  }
}
