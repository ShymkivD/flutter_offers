import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CompanyLocationsTab extends StatefulWidget {
  @override
  _CompanyLocationsTabState createState() => _CompanyLocationsTabState();
}

class _CompanyLocationsTabState extends State<CompanyLocationsTab> {
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(children: <Widget>[
        Container(
          child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                  target: LatLng(45.521563, -122.677433), zoom: 14.0),
              gestureRecognizers: Set()
                ..add(
                  Factory<OneSequenceGestureRecognizer>(
                    () => new EagerGestureRecognizer(),
                  ),
                )),
        ),
        Positioned(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 100.0,
//              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                children: <Widget>[Text('List')],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
