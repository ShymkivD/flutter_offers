import 'package:flutter/material.dart';
import 'package:flutter_offers/ui/widget/items/company_user_review.dart';

class CompanyReviewsPage extends StatelessWidget {
  final List args;
  CompanyReviewsPage(this.args);

  @override
  Widget build(BuildContext context) {
    List users = args[1];
    List reviews = args[0];
    List colorAndTitle = args[2];

    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        title: Text('Отзывы к ' + colorAndTitle[1]),
        backgroundColor: Color(int.parse(colorAndTitle[0])) == Colors.white
            ? Colors.black
            : Color(int.parse(colorAndTitle[0])),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
            padding: const EdgeInsets.all(0.0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: reviews.length,
            itemBuilder: (context, index) => CompanyUserReview(
                  username:
                      users[index].firstName + ' ' + users[index].secondName,
                  rating: reviews[index].rating.toDouble(),
                  review: reviews[index].review,
                  avatar: users[index].userAvatarURL,
                )),
      ),
    );
  }
}
