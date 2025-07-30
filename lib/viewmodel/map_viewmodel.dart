import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../model/place_model.dart';
import '../data/mock_places.dart';
import 'package:flutter_map/flutter_map.dart'; // Marker burada tanımlı


class MapViewModel extends ChangeNotifier {
  final List<PlaceModel> _places = mockPlaces;

  List<PlaceModel> get places => _places;

  List<Marker> get markers {
    return _places.map((place) {
      return Marker(
        width: 40,
        height: 40,
        point: LatLng(place.latitude, place.longitude),
        child: Icon(Icons.location_on, color: Colors.red, size: 40),
      );
    }).toList();
  }
}
