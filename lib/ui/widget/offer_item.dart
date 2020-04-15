import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class OfferItem extends StatelessWidget {
  final bool global;
  final String title;
  final String subTitle;
  final String image;
  StaggeredTile staggeredTile;

  OfferItem(this.title, this.image, {this.subTitle, this.global = false}) {
    if (global)
      this.staggeredTile = const StaggeredTile.count(4, 2.28);
    else
      this.staggeredTile = const StaggeredTile.count(2, 2.72);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Stack(
        children: <Widget>[
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(image),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              gradient: LinearGradient(
                  begin: FractionalOffset.center,
                  end: FractionalOffset.bottomCenter,
                  colors: [Colors.black.withOpacity(0.0), Colors.black87],
                  stops: [0.0, 1.0]),
            ),
          ),
          Positioned(
            child: Align(
              alignment: FractionalOffset.bottomLeft,
              child: ListTile(
                dense: true,
                title: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                subtitle: Text(
                  subTitle,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.54), fontSize: 10),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
