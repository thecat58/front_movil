import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:movil/api/api.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<LatLng> points = [];
  List listOfPoints = [];
  bool isFetchingData = false; // Variable para controlar la carga de datos

  // Método para obtener las coordenadas
  getCoordinates() async {
    setState(() {
      isFetchingData = true; // Iniciando la carga de datos
    });

    var response = await http.get(getRouteUrl(
        "-115.17591623962805,36.1441659750464",
        "-115.18823024661218,36.13837278563257"));

    setState(() {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        listOfPoints = data['futures'][0]['geometry']['coordinates'];
        points = listOfPoints
            .map((e) => LatLng(e[1].toDouble(), e[0].toDouble()))
            .toList();
      }
      isFetchingData = false; // Finalizando la carga de datos
    });
  }

  @override
  void initState() {
    super.initState();
    getCoordinates(); // Llamando a la función para obtener coordenadas cuando se inicializa el widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Mapa en la mitad inferior de la pantalla
          Positioned.fill(
            child: FlutterMap(
              options: const MapOptions(
                initialZoom: 13,
                initialCenter: LatLng(36.14416597504649, -115.17591623962805),
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  userAgentPackageName: 'dev.fleafleat.flutter_map.example',
                ),
                MarkerLayer(markers: [
                  Marker(
                    point: const LatLng(36.14416597504649, -115.17591623962805),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.location_on),
                      color: Colors.cyanAccent,
                      iconSize: 45,
                    ),
                  ),
                  Marker(
                    point: const LatLng(36.13837278563257, -115.18823024661218),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.location_on),
                      color: const Color.fromARGB(255, 158, 25, 20),
                      iconSize: 45,
                    ),
                  ),
                ]),
                PolylineLayer(
                  polylineCulling: false,
                  polylines: [
                    Polyline(
                      points: points,
                      color: const Color.fromARGB(66, 35, 51, 119),
                      strokeWidth: 5,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Contenedor para el rectángulo en la mitad superior de la pantalla
          Positioned(
            top: 500, // Colocarlo en la parte superior
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height /
                  2.5, // Tamaño mitad de la pantalla
              // Tamaño mitad de la pantalla
              color: Colors.black, // Color negro
              child: Center(
                child: Text(
                  'Hola',
                  style: TextStyle(
                    color: Colors.white, // Texto blanco
                    fontSize: 24, // Tamaño de fuente
                    fontWeight: FontWeight.bold, // Negrita
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
