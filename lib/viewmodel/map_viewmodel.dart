import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../model/place_model.dart';
import '../data/mock_places.dart';

class MapViewModel extends ChangeNotifier {
  final List<PlaceModel> _places = mockPlaces;

  List<PlaceModel> get places => _places;

  String _selectedTile = 'osm'; //secilen degeri selectedTile da tuttuk value de

  String get selectedTile => _selectedTile;

  void changeTile(String tile) {
    //degiscek yeni cagırılan tile
    _selectedTile = tile;
    notifyListeners();
  }

  String getTileUrl() {
    //secilen tile a göre onun url ini döncek
    switch (_selectedTile) {
      case 'dark':
        return 'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png';
      case 'light':
        return 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png';
      case 'satellite':
        return 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}';
      default:
        return 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
    }
  }
}
