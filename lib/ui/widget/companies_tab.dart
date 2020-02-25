import 'package:flutter/material.dart';
import './company_tile.dart';

class CompaniesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: <Widget>[
          CompanyTile(company: 'foxtrot', color: Color(0xFFFE5000)),
          CompanyTile(company: 'adidas'),
          CompanyTile(company: 'turkishairlines'),
          CompanyTile(company: 'reebok', color: Color(0xFF0074CD)),
          CompanyTile(company: 'answear', color: Color(0xFFF1B1C8)),
          CompanyTile(company: 'puma', color: Colors.black),
        ],
      ),
    );
  }
}
