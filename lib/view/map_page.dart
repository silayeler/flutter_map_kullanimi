import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:latlong2/latlong.dart';
import '../viewmodel/map_viewmodel.dart';
import '../model/place_model.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController _mapController = MapController();
  PlaceModel? selectedPlace;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MapViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Flutter Map'),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: Colors.redAccent,
                value: viewModel.selectedTile,
                style: const TextStyle(color: Colors.white, fontSize: 14),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                onChanged: (value) {
                  if (value != null) {
                    viewModel.changeTile(value);
                  }
                },
                items: const [
                  DropdownMenuItem(
                    value: 'osm',
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Standart', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'dark',
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Karanlık', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'light',
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Aydınlık', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'satellite',
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Uydu', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: LatLng(39.0, 35.0),
              initialZoom: 6.0,
              onTap: (_, __) {
                setState(() {
                  selectedPlace = null;
                });
              },
            ),
            children: [
              TileLayer(
                retinaMode: true,
                tileSize: 512,
                zoomOffset: -1,
                urlTemplate: viewModel.getTileUrl(),
                userAgentPackageName: 'com.example.map_odev',
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: viewModel.places.map((place) {
                  final isSelected = selectedPlace == place;

                  return Marker(
                    point: LatLng(place.latitude, place.longitude),
                    width: 150,
                    height: isSelected ? 100 : 50,
                    alignment: Alignment.topCenter,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPlace = place;
                        });
                        _mapController.move(
                          LatLng(place.latitude, place.longitude),
                          13.0,
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.location_on, color: Colors.red, size: 40),
                          if (isSelected)
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.redAccent.shade100,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  )
                                ],
                              ),
                              child: Text(
                                place.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                                softWrap: true,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),

          if (selectedPlace != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 60,
                    maxHeight: 250,
                  ),
                  child: SingleChildScrollView(
                    child: Card(
                      color: Colors.white,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectedPlace!.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              selectedPlace!.description,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      // BottomNavigationBar artık MainWrapper'da olduğu için buradan kaldırıldı
    );
  }
}