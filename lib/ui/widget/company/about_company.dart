import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class AboutCompany extends StatefulWidget {
  final String description;

  AboutCompany(this.description, {Key key}) : super(key: key);

  @override
  _AboutCompanyState createState() => _AboutCompanyState();
}

class _AboutCompanyState extends State<AboutCompany> {
  ExpandableController _expandableController;
  bool _expandableButtonTextFlag = false;
  @override
  void initState() {
    super.initState();
    _expandableController = ExpandableController(initialExpanded: false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Icon(
                Icons.info_outline,
                size: 20.0,
                color: Colors.black.withOpacity(0.38),
              ),
            ),
            Expanded(
              flex: 6,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    'О компании',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.54),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                subtitle: Expandable(
                  collapsed: Text(
                    widget.description,
                    softWrap: true,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Text(
                    widget.description,
                    softWrap: true,
                  ),
                  controller: _expandableController,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                setState(() {
                  _expandableController.toggle();
                  _expandableButtonTextFlag = !_expandableButtonTextFlag;
                });
              },
              child: Text(
                (_expandableButtonTextFlag ? 'Свернуть' : 'Детальнее')
                    .toUpperCase(),
                style: TextStyle(
                    color: _expandableButtonTextFlag
                        ? Color(0xFFFF473D)
                        : Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        )
      ],
    );
  }
}
