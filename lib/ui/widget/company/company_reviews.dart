import 'package:flutter/material.dart';
import 'package:flutter_offers/ui/widget/company/company_active_user_review.dart';
import 'package:flutter_offers/ui/widget/company/company_user_review.dart';

class CompanyReviews extends StatefulWidget {
  CompanyReviews({Key key}) : super(key: key);
  final String comment =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
      'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';

  @override
  _CompanyReviewsState createState() => _CompanyReviewsState();
}

class _CompanyReviewsState extends State<CompanyReviews> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text('Отзывы',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.54),
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ),
        ),
        CompanyActiveUserReview(
          username: 'My Comment',
          rating: 5,
          review: widget.comment,
        ),
        CompanyUserReview(
          username: 'User 2',
          rating: 2,
          review: widget.comment,
        ),
        CompanyUserReview(
          username: 'User 1',
          rating: 4,
          review: widget.comment,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Text(
                ('Все отзывы').toUpperCase(),
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
