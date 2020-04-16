import 'package:flutter/material.dart';
import 'package:flutter_offers/models/company.dart';
import 'package:provider/provider.dart';
import '../items/company_item.dart';

class CompaniesTab extends StatefulWidget {
  @override
  _CompaniesTabState createState() => _CompaniesTabState();
}

class _CompaniesTabState extends State<CompaniesTab> {
  @override
  Widget build(BuildContext context) {
    final companies = Provider.of<List<Company>>(context) ?? [];
    final companyList =
        companies.map((company) => CompanyItem(company)).toList();

    return Container(
        padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          children: companyList,
        ));
  }
}
