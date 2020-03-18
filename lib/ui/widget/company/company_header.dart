import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CompanyHeader extends StatelessWidget {
  final List<dynamic> args;
  CompanyHeader(this.args);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        args[0],
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
      subtitle: Text('Lorem ipsum'),
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
            initialRating: 4,
            itemSize: 25,
            onRatingUpdate: (_) {},
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(
              '381,830',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.38), fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
