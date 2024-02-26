import 'package:flutter/material.dart';

class VistaTaller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vista de Taller'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          TarjetaTaller(
            nombre: 'Taller de Reparación de Autos',
            imagenUrl: 'taller1.jpg',
          ),
          TarjetaTaller(
            nombre: 'Taller de Reparación busetas',
            imagenUrl: 'taller2.jpeg', 
          ),
          // Agrega más TarjetaTaller 
        ],
      ),
    );
  }
}

class TarjetaTaller extends StatelessWidget {
  final String nombre;
  final String imagenUrl;

  TarjetaTaller({required this.nombre, required this.imagenUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9, // Proporción de aspecto de la imagen
            child: Image.asset(
              imagenUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              nombre,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: VistaTaller(),
  ));
}
