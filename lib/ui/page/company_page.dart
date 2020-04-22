import 'package:flutter/material.dart';
import 'package:flutter_offers/models/company.dart';
import 'package:flutter_offers/ui/widget/tabs/company_details_tab.dart';
import 'package:flutter_offers/ui/widget/scrollable_app_bar.dart';
import 'package:flutter_offers/ui/widget/tabs/company_locations_tab.dart';

class CompanyPage extends StatefulWidget {
  final Company company;

  CompanyPage(this.company);
  @override
  State<StatefulWidget> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage>
    with TickerProviderStateMixin {
  TabController _companyTabController;

  void initState() {
    _companyTabController =
        TabController(length: 3, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  void dispose() {
    _companyTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse(widget.company.color)),
      body: NestedScrollView(
        headerSliverBuilder: (_, __) {
          return <Widget>[
            ScrollableAppBar(widget.company, _companyTabController)
          ];
        },
        body: Container(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              SizedBox(),
              CompanyDetailsTab(widget.company),
              CompanyLocationsTab(widget.company.locations)
            ],
            controller: _companyTabController,
          ),
        ),
      ),
    );
  }
}
