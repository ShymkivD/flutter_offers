import 'package:flutter/material.dart';
import 'package:flutter_offers/models/company.dart';
import 'package:flutter_offers/services/database.dart';
import 'package:flutter_offers/ui/widget/company/companies_tab.dart';
import 'package:flutter_offers/ui/widget/main_drawer.dart';
import 'package:flutter_offers/ui/widget/offers_tab.dart';
import 'package:flutter_offers/ui/widget/search_app_bar.dart';
import 'package:provider/provider.dart';

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
    return StreamProvider<List<Company>>.value(
      value: DatabaseService().companies,
      child: Scaffold(
          appBar: SearchAppBar(_tabController),
          drawer: MainDrawer(),
          backgroundColor: Colors.white,
          body: TabBarView(
            children: [OffersTab(), CompaniesTab()],
            controller: _tabController,
          )),
    );
  }
}
