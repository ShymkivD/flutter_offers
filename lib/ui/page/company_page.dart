import 'package:flutter/material.dart';
import 'package:flutter_offers/ui/widget/company/company_details_tab.dart';
import 'package:flutter_offers/ui/widget/scrollable_app_bar.dart';

class CompanyPage extends StatefulWidget {
  final List<dynamic> args;

  CompanyPage(this.args);
  @override
  State<StatefulWidget> createState() => _CompanyPageState(args);
}

class _CompanyPageState extends State<CompanyPage>
    with TickerProviderStateMixin {
  TabController _companyTabController;
  final List<dynamic> args;
  _CompanyPageState(this.args);

  void initState() {
    _companyTabController =
        TabController(length: 3, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: args[2],
      body: NestedScrollView(
        headerSliverBuilder: (_, __) {
          return <Widget>[
            ScrollableAppBar(args, _companyTabController),
          ];
        },
        body: Container(
          child: TabBarView(
            children: [SizedBox(), CompanyDetailsTab(args), SizedBox()],
            controller: _companyTabController,
          ),
        ),
      ),
    );
  }
}
