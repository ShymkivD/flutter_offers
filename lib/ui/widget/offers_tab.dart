import 'dart:math';
import 'package:flutter/material.dart';
import './offer_tile.dart';

class OffersTab extends StatelessWidget {
  final offers = [
    OfferTile(offer: "offer1", width: 160, height: 224),
    OfferTile(offer: "offer2", width: 160, height: 224),
    OfferTile(offer: "offer3", width: 328, height: 180)
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
            child: Wrap(
          alignment: WrapAlignment.center,
          children: <Widget>[for (var i = 0; i < 5; i++) ...offers],
        ))
//      child: ListView.builder(
//          itemCount: 21,
//          itemBuilder: (context, index) {
//            if (index >= offers.length) index %= 3;
//            return offers[index];
//          }),
        );
  }
}
