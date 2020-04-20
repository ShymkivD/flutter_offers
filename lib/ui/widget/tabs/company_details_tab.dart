import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offers/models/company.dart';
import 'package:flutter_offers/ui/widget/company/about_company.dart';
import 'package:flutter_offers/ui/widget/company/company_header.dart';
import 'package:flutter_offers/ui/widget/company/company_review_form.dart';
import 'package:flutter_offers/ui/widget/company/company_reviews.dart';
import 'package:flutter_offers/ui/widget/company/work_schedule.dart';

class CompanyDetailsTab extends StatefulWidget {
  final Company company;
  CompanyDetailsTab(this.company, {Key key}) : super(key: key);

  @override
  _CompanyDetailsTabState createState() => _CompanyDetailsTabState();
}

class _CompanyDetailsTabState extends State<CompanyDetailsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CompanyHeader(
                title: widget.company.title,
                type: widget.company.type,
                rating: widget.company.rating,
                votes: widget.company.votes,
              ),
              Divider(),
              AboutCompany(widget.company.description),
              Divider(),
              WorkSchedule(widget.company.workingDays),
              Divider(),
              CompanyReviews(
                widget.company.id,
                color: widget.company.color,
                companyName: widget.company.title,
              ),
            ]),
      ),
    );
  }
}
