import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../services/location_service.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? userLocation;
  bool isLoading = true;
  final LocationService _locationService = LocationService();
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    _getUserLocation(); // Get informations about localization when start the app
  }

  Future<void> _getUserLocation() async {
    print("Getting the user's location...");
    final location = await _locationService.getCurrentLocation();
    print("Location obtained: $location");
    setState(() {
      userLocation = location;
      isLoading = false;
    });
    // Move the map to a new location
    if (userLocation != null) {
      print("Moving the map to: $userLocation");
      _mapController.move(userLocation!, 15.0);
    } else {
      print("User location is null");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OpenStreetMaps and Camera'),
        backgroundColor: Colors.blue[800],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                center:
                    userLocation, // Centralize the map in center of the screen
                zoom: 15.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.maps_brasilia_osm',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 40.0,
                      height: 40.0,
                      point: userLocation!, // Mark in the location of the user
                      child: const Icon(
                        Icons.location_pin,
                        color: Colors.red,
                        size: 40.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            _getUserLocation, // Update localization when click in the map
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
