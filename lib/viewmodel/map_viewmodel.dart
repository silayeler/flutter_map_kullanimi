import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../model/place_model.dart';
import '../data/mock_places.dart';

class MapViewModel extends ChangeNotifier {
  final List<PlaceModel> _places = mockPlaces;

  List<PlaceModel> get places => _places;

  // 🔴 Seçili tile türü tutulur
  String _selectedTile = 'osm';

  String get selectedTile => _selectedTile;

  // 🔄 Tile türü değiştir
  void changeTile(String tile) {
    _selectedTile = tile;
    notifyListeners();
  }

  // 🌍 Tile URL’sini döndür
  String getTileUrl() {
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
