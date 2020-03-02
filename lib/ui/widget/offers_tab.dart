import 'package:flutter/material.dart';
import './offer_tile.dart';

class OffersTab extends StatelessWidget {
  final offers = [
    OfferTile(offer: "offer1", width: 160.0, height: 224.0),
    OfferTile(offer: "offer2", width: 160.0, height: 224.0),
    OfferTile(offer: "offer3", width: 328.0, height: 180.0)
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
            child: Wrap(
          alignment: WrapAlignment.center,
          children: <Widget>[for (var i = 0; i < 5; i++) ...offers],
        )));
  }
}
