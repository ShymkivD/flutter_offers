import 'package:flutter/material.dart';
import 'package:flutter_offers/services/database.dart';
import 'package:flutter_offers/ui/widget/red_material_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CompanyReviewForm extends StatefulWidget {
  final String uid;
  final String id;
  final String userAvatarURL;
  final String review;
  final double rating;
  final Function onSubmit;

  CompanyReviewForm(
      this.id, this.uid, this.userAvatarURL, this.rating, this.review,
      {Key key, this.onSubmit})
      : super(key: key);

  @override
  _CompanyReviewFormState createState() => _CompanyReviewFormState();
}

class _CompanyReviewFormState extends State<CompanyReviewForm> {
  final _formKey = GlobalKey<FormState>();
  String review;
  double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF6F6F6),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: CircleAvatar(
                radius: 45.0,
                backgroundImage: widget.userAvatarURL == null
                    ? AssetImage('assets/images/avatar.png')
                    : NetworkImage(widget.userAvatarURL),
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
                  scale: 1.9,
                ),
                noRatingWidget: Image.asset(
                  'assets/images/starUnActive.png',
                  scale: 1.9,
                ),
                initialRating: widget.rating ?? 0.0,
                itemSize: 25,
                onRatingUpdate: (currentRating) =>
                    setState(() => rating = currentRating),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                validator: (val) => val.length <= 3
                    ? 'Напишите отзыв длиной более 3 символов'
                    : null,
                initialValue: widget.review,
                onChanged: (value) {
                  setState(() => review = value);
                },
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
                padding: const EdgeInsets.symmetric(
                    horizontal: 110.0, vertical: 15.0),
                title: 'Опубликовать',
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    await DatabaseService(uid: widget.uid).updateCompanyReview(
                        widget.id,
                        rating != null ? rating.toInt() : widget.rating.toInt(),
                        review != null ? review : widget.review);
                  }
                  widget.onSubmit();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
