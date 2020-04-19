import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offers/models/user.dart';
import 'package:flutter_offers/services/database.dart';
import 'package:flutter_offers/ui/widget/company/company_review_form.dart';
import 'package:flutter_offers/ui/widget/items/company_user_review.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class CompanyActiveUserReview extends StatefulWidget {
  final String username;
  final double rating;
  final String avatar;
  final String review;
  final String companyID;

  const CompanyActiveUserReview(
      {Key key,
      this.username,
      this.rating = 0.0,
      this.avatar,
      this.review,
      this.companyID})
      : super(key: key);

  @override
  _CompanyActiveUserReviewState createState() =>
      _CompanyActiveUserReviewState();
}

class _CompanyActiveUserReviewState extends State<CompanyActiveUserReview> {
  final _slidableKey = GlobalKey<SlidableState>();
  List<Widget> actions;
  List<Widget> primaryActions;
  String actionType;
  bool edit = false;

  @override
  void initState() {
    super.initState();
    primaryActions = <Widget>[
      Column(
        children: <Widget>[
          Expanded(
            child: IconSlideAction(
                color: Color(0xFFFF473D),
                icon: Icons.delete,
                onTap: () {
                  setState(() {
                    actionType = 'Delete';
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
                onTap: () {
                  setState(() {
                    actionType = 'Edit';
                    actions = <Widget>[
                      IconSlideAction(
                          color: Color(0xFF3C83EE), icon: Icons.edit)
                    ];
                  });
                  _slidableKey.currentState.dismiss();
                }),
          ),
        ],
      ),
    ];
    actions = primaryActions;
  }

  @override
  Widget build(BuildContext context) {
    String uid = Provider.of<User>(context, listen: false).uid;
    return !edit
        ? Slidable(
            key: _slidableKey,
            actionPane: SlidableStrechActionPane(),
            actionExtentRatio: 0.25,
            dismissal: SlidableDismissal(
              onDismissed: (_) async {
                if (actionType == 'Delete') {
                  await DatabaseService(uid: uid)
                      .deleteCompanyReview(widget.companyID);
                } else {
                  setState(() {
                    edit = true;
                  });
                }
              },
              dragDismissible: false,
              child: SlidableDrawerDismissal(),
            ),
            secondaryActions: actions,
            child: Container(
              color: Color(0xFFF6F6F6),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    height: MediaQuery.of(context).size.height,
                    child: Container(
                        alignment: Alignment.topLeft,
                        color: Theme.of(context).primaryColor,
                        width: 3.0),
                  ),
                  CompanyUserReview(
                    username: widget.username,
                    rating: widget.rating,
                    review: widget.review,
                    avatar: widget.avatar,
                  )
                ],
              ),
            ),
          )
        : CompanyReviewForm(
            widget.companyID, uid, widget.avatar, widget.rating, widget.review,
            onSubmit: () => setState(() {
                  actions = primaryActions;
                  return edit = false;
                }));
  }
}
