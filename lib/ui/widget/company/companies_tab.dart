import 'package:flutter/material.dart';
import 'package:flutter_offers/models/company.dart';
import 'package:provider/provider.dart';
import 'company_tile.dart';

class CompaniesTab extends StatefulWidget {
//  final companyList = <Widget>[
//    CompanyTile('Фокстрот', 'assets/images/logos/foxtrot.png',
//        color: Color(0xFFFE5000)),
//    CompanyTile('Adidas', 'assets/images/logos/adidas.png'),
//    CompanyTile('Turkish Airlines', 'assets/images/logos/turkishairlines.png'),
//    CompanyTile('Reebok', 'assets/images/logos/reebok.png',
//        color: Color(0xFF0074CD)),
//    CompanyTile('Answear', 'assets/images/logos/answear.png',
//        color: Color(0xFFF1B1C8)),
//    CompanyTile('Puma', 'assets/images/logos/puma.png', color: Colors.black),
//  ];

  @override
  _CompaniesTabState createState() => _CompaniesTabState();
}

class _CompaniesTabState extends State<CompaniesTab> {
  @override
  Widget build(BuildContext context) {
    final companies = Provider.of<List<Company>>(context) ?? [];
    final companyList =
        companies.map((company) => CompanyTile(company)).toList();

    return Container(
        padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          children: companyList,
        ));
  }
}
