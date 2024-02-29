import 'package:flutter/material.dart';

class VistaTaller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Establecer el color de fondo del AppBar
        centerTitle: true, // Centrar el título (en este caso, el logo)
        title: Container(
          padding: EdgeInsets.all(10.0), // Añadir espacio de relleno alrededor del logo
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), // Añadir bordes redondeados al contenedor
            color: Colors.blue, // Color de fondo del contenedor (coincide con el color del AppBar)
          ),
          child: Image.asset(
            'assets/logo.png', // Ruta de la imagen del logo de tu aplicación
            width: 50, // Ancho deseado del logo
            height: 50, // Alto deseado del logo
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Mostrar dos tarjetas por fila
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          TarjetaTaller(
            nombre: 'Taller de Reparación de Autos',
            imagenUrl: 'assets/taller2.png',
            width: 150,
            height: 150,
          ),
          TarjetaTaller(
            nombre: 'Taller de Reparación de Motos',
            imagenUrl: 'assets/taller1.png',
            width: 150,
            height: 150,
          ),
          // Puedes agregar más TarjetaTaller aquí
        ],
      ),
    );
  }
}

class TarjetaTaller extends StatelessWidget {
  final String nombre;
  final String imagenUrl;
  final double width;
  final double height;

  TarjetaTaller({
    required this.nombre,
    required this.imagenUrl,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
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
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
