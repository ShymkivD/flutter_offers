import 'package:flutter/material.dart';

class OfferTile extends StatelessWidget {
  final double width;
  final double height;
  final String offer;
  const OfferTile({this.width, this.height, this.offer});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        width: width,
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset('assets/images/offers/$offer.png'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.center,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.0),
                        Colors.black87,
                      ],
                      stops: [
                        0.0,
                        1.0
                      ])),
            ),
            Positioned(
              child: Align(
                alignment: FractionalOffset.bottomLeft,
                child: ListTile(
                  dense: true,
                  title: Text(
                    "Название акции lorem",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  subtitle: Text(
                    "до 12.01.2019",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.54), fontSize: 10),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
