import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CompanyDetailsTab extends StatefulWidget {
  final List<dynamic> args;
  final String about =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute iru...';
  CompanyDetailsTab(this.args, {Key key}) : super(key: key);

  @override
  _CompanyDetailsTabState createState() => _CompanyDetailsTabState();
}

class _CompanyDetailsTabState extends State<CompanyDetailsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: <Widget>[
        ListTile(
          title: Text(
            widget.args[0],
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          subtitle: Text('Lorem ipsum'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              FlutterRatingBar(
                fillColor: Color(0xFFF88821),
                noRatingWidget:
                    Icon(Icons.star, color: Colors.black.withOpacity(0.12)),
                initialRating: 4,
                itemSize: 25,
                onRatingUpdate: (_) {},
              ),
              Text(
                '381,830',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.38), fontSize: 12),
              )
            ],
          ),
        ),
        Divider(),
        ListTile(
          leading: Column(
            children: <Widget>[
              Icon(Icons.info_outline),
            ],
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Text(
              'О компании',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.54),
                  fontWeight: FontWeight.w600),
            ),
          ),
          subtitle: ExpandablePanel(
            collapsed: Text(
              widget.about,
              softWrap: true,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              widget.about,
              softWrap: true,
            ),
          ),
        ),
        Divider()
      ]),
    );
  }
}
