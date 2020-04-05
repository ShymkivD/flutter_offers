import 'package:flutter/material.dart';
import 'package:flutter_offers/ui/widget/red_material_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CompanyReviewForm extends StatefulWidget {
  CompanyReviewForm({Key key}) : super(key: key);

  @override
  _CompanyReviewFormState createState() => _CompanyReviewFormState();
}

class _CompanyReviewFormState extends State<CompanyReviewForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF6F6F6),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Image.asset(
              'assets/images/avatar.png',
              scale: 1.7,
            ),
          ),
          Text(
            'Оставить отзыв',
            style: TextStyle(fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 8.0, 40.0, 25.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.54), fontSize: 14.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: FlutterRatingBar(
              itemPadding: EdgeInsets.symmetric(horizontal: 12.0),
              fullRatingWidget: Image.asset(
                'assets/images/starActive.png',
                scale: 1.5,
              ),
              noRatingWidget: Image.asset(
                'assets/images/starUnActive.png',
                scale: 1.5,
              ),
              initialRating: 0,
              itemSize: 25,
              onRatingUpdate: (_) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Color(0xFFF6F6F6),
                filled: true,
                hintText: 'Опишите свои впечатления',
                contentPadding: EdgeInsets.all(12.0),
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFF6F6F6),
                    width: 2.0,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.14),
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.14), width: 1.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: RedMaterialButton(
              padding:
                  const EdgeInsets.symmetric(horizontal: 110.0, vertical: 15.0),
              title: 'Опубликовать',
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
