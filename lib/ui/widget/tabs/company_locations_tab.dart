import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offers/models/place.dart';
import 'package:flutter_offers/ui/widget/loading.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

import 'package:flutter_offers/api_key.dart';

class CompanyLocationsTab extends StatefulWidget {
  final List<String> locations;
  CompanyLocationsTab(this.locations);
  @override
  _CompanyLocationsTabState createState() => _CompanyLocationsTabState();
}

class _CompanyLocationsTabState extends State<CompanyLocationsTab> {
  Completer<GoogleMapController> _controller = Completer();
  final _placesService = GoogleMapsPlaces(apiKey: googleApiKey);
  LatLng _initialPosition;
  List<Place> places = [];
  final Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Place>>(
        future: Future.wait(widget.locations.map(_getDetailsAboutPlace)),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: <Widget>[
                GoogleMap(
                    rotateGesturesEnabled: false,
                    onMapCreated: _onMapCreated,
                    markers: markers,
                    initialCameraPosition: CameraPosition(
                        target: _initialPosition ?? LatLng(0.0, 0.0),
                        zoom: 11.0),
                    gestureRecognizers: Set()
                      ..add(
                        Factory<OneSequenceGestureRecognizer>(
                          () => EagerGestureRecognizer(),
                        ),
                      )),
                DraggableScrollableActuator(
                  child: DraggableScrollableSheet(
                      initialChildSize: 0.4,
                      minChildSize: 0.4,
                      maxChildSize: 0.95,
                      builder: _bottomPanel),
                )
              ],
            );
          } else {
            return Loading();
          }
        });
  }

  void _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
  }

  Future<Place> _getDetailsAboutPlace(String placeId) async {
    var placeDetails =
        await _placesService.getDetailsByPlaceId(placeId, language: 'RU');
    var place = placeDetails.result;

    String photoUrl = _placesService.buildPhotoUrl(
      photoReference: place.photos[0].photoReference,
      maxHeight: 150,
    );
    final position =
        LatLng(place.geometry.location.lat, place.geometry.location.lng);
    Place _place = Place(place.name, place.vicinity, photoUrl, position);
    _savePlace(_place);
    return _place;
  }

  void _savePlace(Place place) {
    _initialPosition =
        LatLng(place.position.latitude, place.position.longitude);

    places.add(place);
    markers.add(Marker(
      markerId: MarkerId(place.position.toString()),
      position: place.position,
      infoWindow: InfoWindow(
        title: place.name,
        snippet: place.vicinity,
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));
  }

  Widget _bottomPanel(context, ScrollController scrollController) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              color: Colors.grey,
            ),
          ]),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 22.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.12),
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(40.0, 30.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Center(
                child: Text(
                  'Список магазинов',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => Divider(
                      indent: 85.0,
                      color: Colors.black.withOpacity(0.35),
                    ),
                padding: EdgeInsets.all(0.0),
                shrinkWrap: true,
                itemCount: places.length,
                itemBuilder: (_, index) {
                  var place = places[index];
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      child: ListTile(
                        leading: Container(
                          child: place.imageUrl.isNotEmpty
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(place.imageUrl),
                                )
                              : Container(),
                          width: 60,
                          height: 60,
                        ),
                        title: Text(place.name),
                        subtitle: Text(place.vicinity),
                        onTap: () async {
                          final controller = await _controller.future;
                          await controller.animateCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                target: place.position,
                                zoom: 11,
                              ),
                            ),
                          );
                          DraggableScrollableActuator.reset(context);
                        },
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
