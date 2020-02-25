import 'package:flutter/material.dart';

class CompanyTile extends StatelessWidget {
  final String company;
  final Color color;
  CompanyTile({this.color = Colors.white, this.company});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: color,
      child: Container(
        width: 164,
        height: 103,
        child: Image.asset('assets/images/logos/$company.png'),
      ),
    );
  }
}
