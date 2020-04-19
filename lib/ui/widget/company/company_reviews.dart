import 'package:flutter/material.dart';
import 'package:flutter_offers/models/company_review.dart';
import 'package:flutter_offers/models/user.dart';
import 'package:flutter_offers/services/database.dart';
import 'package:flutter_offers/ui/widget/company/company_active_user_review.dart';
import 'package:flutter_offers/ui/widget/company/company_review_form.dart';
import 'package:flutter_offers/ui/widget/items/company_user_review.dart';
import 'package:provider/provider.dart';

class CompanyReviews extends StatefulWidget {
  final String id;
  CompanyReviews(this.id, {Key key}) : super(key: key);

  @override
  _CompanyReviewsState createState() => _CompanyReviewsState();
}

class _CompanyReviewsState extends State<CompanyReviews> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return StreamBuilder<List<CompanyReview>>(
        stream: DatabaseService().reviews(widget.id),
        builder: (context, snapshot) {
          List<CompanyReview> reviews = snapshot.data;
          print('Total reviews for: ' + reviews?.length.toString());

          var usersIDs = reviews != null
              ? reviews.map((review) => review.uid).toList()
              : null;

          var activeUserReview = reviews != null
              ? reviews.isEmpty
                  ? null
                  : reviews.firstWhere((review) => review.uid == user.uid,
                      orElse: () => null)
              : null;

          reviews = activeUserReview != null
              ? reviews.where((review) => review != activeUserReview).toList()
              : reviews;

          if (snapshot.hasData) {
            return StreamBuilder<List<UserData>>(
                stream: DatabaseService().reviewsUserData(usersIDs.isEmpty
                    ? [user.uid]
                    : !usersIDs.contains(user.uid)
                        ? [...usersIDs, user.uid]
                        : usersIDs),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var users = snapshot.data;
                    var activeUserData = users.isNotEmpty
                        ? users.firstWhere((usr) => usr.uid == user.uid,
                            orElse: () => null)
                        : null;
                    users = activeUserData != null
                        ? users.where((user) => user != activeUserData).toList()
                        : users;

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
                        reviews.isEmpty && activeUserReview == null
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Text('Нет отзывов',
                                    style: Theme.of(context).textTheme.title),
                              )
                            : SizedBox(),
                        if (activeUserReview != null)
                          CompanyActiveUserReview(
                            username: activeUserData.firstName +
                                ' ' +
                                activeUserData.secondName,
                            rating: activeUserReview.rating.toDouble(),
                            review: activeUserReview.review,
                            avatar: activeUserData.userAvatarURL,
                            companyID: widget.id,
                          ),
                        ListView.builder(
                            padding: const EdgeInsets.all(0.0),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: reviews.length,
                            itemBuilder: (context, index) => CompanyUserReview(
                                  username: users[index].firstName +
                                      ' ' +
                                      users[index].secondName,
                                  rating: reviews[index].rating.toDouble(),
                                  review: reviews[index].review,
                                  avatar: users[index].userAvatarURL,
                                )),
                        users.length > 3
                            ? Row(
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
                              )
                            : SizedBox(),
                        if (activeUserReview == null)
                          CompanyReviewForm(
                              widget.id,
                              user.uid,
                              activeUserData?.userAvatarURL,
                              activeUserReview?.rating?.toDouble(),
                              activeUserReview?.review)
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
