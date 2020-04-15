import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_offers/ui/widget/offer_item.dart';

class OffersTab extends StatelessWidget {
  final offers = [
    OfferItem('offer1', 'assets/images/offers/offer1.png',
        subTitle: "до 12.01.2019"),
    OfferItem('offer2', 'assets/images/offers/offer2.png',
        subTitle: "до 12.01.2019"),
    OfferItem('offer3', 'assets/images/offers/offer3.png',
        subTitle: "до 12.01.2019", global: true),
    OfferItem('offer1', 'assets/images/offers/offer1.png',
        subTitle: "до 12.01.2019"),
    OfferItem('offer2', 'assets/images/offers/offer2.png',
        subTitle: "до 12.01.2019"),
    OfferItem('offer3', 'assets/images/offers/offer3.png',
        subTitle: "до 12.01.2019", global: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StaggeredGridView.countBuilder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      crossAxisCount: 4,
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      itemCount: this.offers.length,
      itemBuilder: (BuildContext context, int index) => offers[index],
      staggeredTileBuilder: (int index) => this.offers[index].staggeredTile,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    ));
  }
}
