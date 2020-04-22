import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  final String name;
  final String vicinity;
  final String imageUrl;
  final LatLng position;

  Place(this.name, this.vicinity, this.imageUrl, this.position);
}
