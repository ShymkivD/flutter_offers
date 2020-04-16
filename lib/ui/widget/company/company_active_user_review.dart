import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offers/ui/widget/items/company_user_review.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CompanyActiveUserReview extends StatefulWidget {
  final String username;
  final double rating;
  final String avatar;
  final String review;

  const CompanyActiveUserReview({
    Key key,
    this.username,
    this.rating = 0.0,
    this.avatar = 'assets/images/avatar.png',
    this.review,
  }) : super(key: key);

  @override
  _CompanyActiveUserReviewState createState() =>
      _CompanyActiveUserReviewState();
}

class _CompanyActiveUserReviewState extends State<CompanyActiveUserReview> {
  final _slidableKey = GlobalKey<SlidableState>();
  List<Widget> actions;

  @override
  void initState() {
    super.initState();
    actions = <Widget>[
      Column(
        children: <Widget>[
          Expanded(
            child: IconSlideAction(
                color: Color(0xFFFF473D),
                icon: Icons.delete,
                onTap: () {
                  setState(() {
                    actions = <Widget>[
                      IconSlideAction(
                          color: Color(0xFFFF473D), icon: Icons.delete)
                    ];
                  });
                  _slidableKey.currentState.dismiss();
                }),
          ),
          Expanded(
            child: IconSlideAction(
              color: Color(0xFF3C83EE),
              icon: Icons.edit,
            ),
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: _slidableKey,
      actionPane: SlidableStrechActionPane(),
      actionExtentRatio: 0.25,
      dismissal: SlidableDismissal(
        dragDismissible: false,
        child: SlidableDrawerDismissal(),
      ),
      secondaryActions: actions,
      child: Container(
        color: Color(0xFFF6F6F6),
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  color: Theme.of(context).primaryColor,
                  width: 3.0,
                  height: 160.0,
                ),
              ),
            ),
            CompanyUserReview(
              username: widget.username,
              rating: widget.rating,
              review: widget.review,
            ),
          ],
        ),
      ),
    );
  }
}
