import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CompanyUserReview extends StatelessWidget {
  final String username;
  final double rating;
  final String avatar;
  final String review;

  const CompanyUserReview({
    Key key,
    this.username,
    this.rating = 0.0,
    this.avatar = 'assets/images/avatar.png',
    this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(flex: 1, child: Image.asset(avatar)),
          Expanded(
            flex: 6,
            child: ListTile(
              title: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.topLeft, child: Text(username)),
                      Align(
                        alignment: Alignment.topLeft,
                        child: FlutterRatingBar(
                          ignoreGestures: true,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          fullRatingWidget: Image.asset(
                            'assets/images/starActive.png',
                            scale: 4,
                          ),
                          noRatingWidget: Image.asset(
                            'assets/images/starUnActive.png',
                            scale: 4,
                          ),
                          initialRating: rating,
                          itemSize: 25,
                          onRatingUpdate: (_) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              subtitle: Text(
                review,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
