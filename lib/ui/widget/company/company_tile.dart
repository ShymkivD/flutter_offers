import 'package:flutter/material.dart';
import 'package:flutter_offers/custom_routes.dart';

class CompanyTile extends StatelessWidget {
  final String image;
  final String companyName;
  final Color color;
  CompanyTile(this.companyName, this.image, {this.color = Colors.white});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CustomRoutes.COMPANY_PAGE,
            arguments: [companyName, image, color]);
      },
      child: Card(
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          color: color,
          child: Image.asset(image, scale: 2.6)),
    );
  }
}
