import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:movil/api/api.dart';

class MapScreen2 extends StatefulWidget {
  const MapScreen2({super.key});

  @override
  State<StatefulWidget> createState() => _MapScreen2State();
}

class _MapScreen2State extends State<MapScreen2> {
  List<LatLng> points = [];
  List listOfPoints = [];
  getCoordinates() async {
    var response = await http.get(getRouteUrl(
        "-115.17591623962805,36.1441659750464",
        "-115.18823024661218,36.13837278563257"));

    setState(() {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        listOfPoints = data['futures'][0]['geometry']['coordinates'];
        points = listOfPoints.map((e) => LatLng(e[1].toDouble(), e[0].toDouble())).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {

     return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 205, 82, 69),
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Image.asset(
            'assets/logo.png',
            width: 50,
            height: 50,
          ),
        ),
      ),
      body: FlutterMap(
          options: const MapOptions(
              initialZoom: 13,
              initialCenter: LatLng(36.14416597504649, -115.17591623962805)),
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
                  )),
              Marker(
                  point: const LatLng(36.13837278563257, -115.18823024661218),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.location_on),
                    color: const Color.fromARGB(255, 158, 25, 20),
                    iconSize: 45,
                  ))
            ]
            ),

            PolylineLayer(
              polylineCulling: false,
              polylines: [
                Polyline(points: points, color: const Color.fromARGB(66, 35, 51, 119), strokeWidth: 5),
              ],
            )
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
