import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offers/models/company.dart';
import 'package:flutter_offers/ui/widget/company/about_company.dart';
import 'package:flutter_offers/ui/widget/company/company_header.dart';
import 'package:flutter_offers/ui/widget/company/work_schedule.dart';
import 'package:flutter_offers/ui/widget/red_material_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CompanyDetailsTab extends StatefulWidget {
  final Company company;
  final String comment =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
      'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';
  CompanyDetailsTab(this.company, {Key key}) : super(key: key);

  @override
  _CompanyDetailsTabState createState() => _CompanyDetailsTabState();
}

class _CompanyDetailsTabState extends State<CompanyDetailsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CompanyHeader(
                title: widget.company.title,
                type: widget.company.type,
                rating: widget.company.rating,
                votes: widget.company.votes,
              ),
              Divider(),
              AboutCompany(widget.company.description),
              Divider(),
              WorkSchedule(widget.company.workingDays),
              Divider(),
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
              Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                background: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          alignment: AlignmentDirectional.centerEnd,
                          color: Color(0xFFFF473D),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 25.0),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: AlignmentDirectional.centerEnd,
                          color: Color(0xFF3C83EE),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 25.0),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
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
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: Image.asset(
                                  'assets/images/avatar.png',
                                  scale: 2,
                                )),
                            Expanded(
                              flex: 6,
                              child: ListTile(
                                title: Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 20.0),
                                    child: Column(
                                      children: <Widget>[
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text('My Comment')),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: FlutterRatingBar(
                                            ignoreGestures: true,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 2.0),
                                            fullRatingWidget: Image.asset(
                                              'assets/images/starActive.png',
                                              scale: 4,
                                            ),
                                            noRatingWidget: Image.asset(
                                              'assets/images/starUnActive.png',
                                              scale: 4,
                                            ),
                                            initialRating: 4,
                                            itemSize: 25,
                                            onRatingUpdate: (_) {},
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                subtitle: Text(widget.comment),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Image.asset('assets/images/avatar.png')),
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
                                    alignment: Alignment.topLeft,
                                    child: Text('User 1')),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: FlutterRatingBar(
                                    ignoreGestures: true,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 2.0),
                                    fullRatingWidget: Image.asset(
                                      'assets/images/starActive.png',
                                      scale: 4,
                                    ),
                                    noRatingWidget: Image.asset(
                                      'assets/images/starUnActive.png',
                                      scale: 4,
                                    ),
                                    initialRating: 4,
                                    itemSize: 25,
                                    onRatingUpdate: (_) {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        subtitle: Text(widget.comment),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Image.asset('assets/images/avatar.png')),
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
                                    alignment: Alignment.topLeft,
                                    child: Text('User 2')),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: FlutterRatingBar(
                                    ignoreGestures: true,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 2.0),
                                    fullRatingWidget: Image.asset(
                                      'assets/images/starActive.png',
                                      scale: 4,
                                    ),
                                    noRatingWidget: Image.asset(
                                      'assets/images/starUnActive.png',
                                      scale: 4,
                                    ),
                                    initialRating: 2,
                                    itemSize: 25,
                                    onRatingUpdate: (_) {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        subtitle: Text(
                          widget.comment,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
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
              Container(
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
                            color: Colors.black.withOpacity(0.54),
                            fontSize: 14.0),
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
                                color: Colors.black.withOpacity(0.14),
                                width: 1.0),
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
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
