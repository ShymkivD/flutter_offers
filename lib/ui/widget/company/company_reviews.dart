import 'package:flutter/material.dart';
import 'package:flutter_offers/models/company_review.dart';
import 'package:flutter_offers/models/user.dart';
import 'package:flutter_offers/services/database.dart';
import 'package:flutter_offers/ui/widget/company/company_active_user_review.dart';
import 'package:flutter_offers/ui/widget/company/company_review_form.dart';
import 'package:flutter_offers/ui/widget/items/company_user_review.dart';
import 'package:provider/provider.dart';

class CompanyReviews extends StatefulWidget {
  List<CompanyReview> companyReviews;
  CompanyReviews(this.companyReviews, {Key key}) : super(key: key);
  final String comment =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
      'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';

  @override
  _CompanyReviewsState createState() => _CompanyReviewsState();
}

class _CompanyReviewsState extends State<CompanyReviews> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

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
                CompanyReviewForm(userData.userAvatarURL)
              ],
            );
          } else {
            return Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
