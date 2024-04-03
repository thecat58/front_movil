import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:movil/api/api.dart';
import 'package:movil/pages/taller/vista_taller.dart';

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
        "-4.460019457618955,36.70482003977633 ",
        "-4.460019457618955,36.70482003977633 "));

    setState(() {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data != null &&
            data['futures'] != null &&
            data['futures'].isNotEmpty &&
            data['futures'][0]['geometry'] != null &&
            data['futures'][0]['geometry']['coordinates'] != null) {
          listOfPoints = data['futures'][0]['geometry']['coordinates'];
          points = listOfPoints
              .map((e) => LatLng(e[1].toDouble(), e[0].toDouble()))
              .toList();
        } else {
          // La respuesta no contiene los datos esperados
          // Puedes mostrar un mensaje de error o tomar alguna acción adecuada
        }
      } else {
        // La solicitud HTTP no tuvo éxito
        // Puedes mostrar un mensaje de error o tomar alguna acción adecuada
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
      body: Stack(children: [
        // Mapa en la mitad inferior de la pantalla
        Positioned.fill(
          child: FlutterMap(
            options: const MapOptions(
              initialZoom: 13,
              initialCenter: LatLng(36.70482003977633, -4.460019457618955),
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: 'dev.fleafleat.flutter_map.example',
              ),
              MarkerLayer(markers: [
                Marker(
                  point: const LatLng(36.70482003977633, -4.460019457618955),
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
          top: 600, // Colocarlo en la parte superior
          left: 0,
          right: 0,
          child: Container(
            height: MediaQuery.of(context).size.height /
                4, // Tamaño mitad de la pantalla
            color: Colors.black, // Color negro
            child: Center(
              child: Container(
                color: Color(0xFF333333),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildSmallCard('assets/imgcateg1.png',
                            'Mantenimiento general', Colors.red),
                        _buildSmallCard('assets/imgcateg2.png',
                            'Reparaciones Mecanicas', Colors.grey),
                        _buildSmallCard('assets/imgcateg3.png',
                            'Neumáticos y Ruedas', Colors.red),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VistaTaller()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.grey),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Text(
                            'Ver Más',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

Widget _buildSmallCard(
    String imagePath, String description, Color backgroundColor) {
  return Container(
    width: 80,
    height: 120,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 70,
          ),
        ),
        SizedBox(height: 8),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}
