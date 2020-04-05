import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CompanyHeader extends StatelessWidget {
  final String title;
  final String type;
  final int rating;
  final int votes;
  CompanyHeader({this.title, this.type, this.rating, this.votes});

  final RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(type),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FlutterRatingBar(
            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
            fillColor: Color(0xFFF88821),
            fullRatingWidget: Image.asset(
              'assets/images/starActive.png',
              scale: 2.5,
            ),
            noRatingWidget: Image.asset(
              'assets/images/starUnActive.png',
              scale: 2.5,
            ),
            initialRating: rating.toDouble(),
            itemSize: 25,
            onRatingUpdate: (_) {},
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(
              votes.toString().replaceAllMapped(reg, (match) => '${match[1]},'),
              style: TextStyle(
                  color: Colors.black.withOpacity(0.38), fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
