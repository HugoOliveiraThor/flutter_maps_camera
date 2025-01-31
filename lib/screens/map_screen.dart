import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../services/location_service.dart'; // Importe o serviço de localização

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? userLocation; // Armazena a localização do usuário
  bool isLoading = true; // Controla o estado de carregamento
  final LocationService _locationService =
      LocationService(); // Instância do serviço

  @override
  void initState() {
    super.initState();
    _getUserLocation(); // Obtém a localização ao iniciar o app
  }

  // Função para obter a localização do usuário
  Future<void> _getUserLocation() async {
    final location = await _locationService.getCurrentLocation();
    setState(() {
      userLocation = location;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Localização no Mapa'),
        backgroundColor: Colors.blue[800],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Mostra um loading
          : FlutterMap(
              options: MapOptions(
                center:
                    userLocation, // Centraliza o mapa na localização do usuário
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
                      point:
                          userLocation!, // Marcador na localização do usuário
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
        onPressed: _getUserLocation, // Atualiza a localização ao clicar
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
