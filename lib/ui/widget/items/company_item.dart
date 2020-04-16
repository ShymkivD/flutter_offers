import 'package:flutter/material.dart';
import 'package:flutter_offers/custom_routes.dart';
import 'package:flutter_offers/models/company.dart';

class CompanyItem extends StatelessWidget {
  final Company company;

  CompanyItem(this.company);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CustomRoutes.COMPANY_PAGE,
            arguments: company);
      },
      child: Card(
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          color: Color(int.parse(company.color)),
          child: Hero(
              tag: company.image,
              child: Image.asset(company.image, scale: 2.6))),
    );
  }
}
