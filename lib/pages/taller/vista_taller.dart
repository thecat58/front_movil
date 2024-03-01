import 'package:flutter/material.dart';
import 'package:movil/pages/taller/registrar_taller.dart';

class VistaTaller extends StatelessWidget {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: '',
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 205, 82, 69),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                GridView.count(
                  crossAxisCount: 2,
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
                    TarjetaTaller(
                      nombre: 'Taller de Reparación de Motos',
                      imagenUrl: 'assets/taller1.png',
                      width: 150,
                      height: 150,
                    ),
                    TarjetaTaller(
                      nombre: 'Taller de Reparación de Motos',
                      imagenUrl: 'assets/taller1.png',
                      width: 150,
                      height: 150,
                    ),
                    TarjetaTaller(
                      nombre: 'Taller de Reparación de Motos',
                      imagenUrl: 'assets/taller1.png',
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
                Positioned(
                  bottom: 80.0,
                  right: 20.0,
                  child: BotonFlotante(), // Aquí se inserta el botón flotante
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Clase del botón flotante
class BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color.fromARGB(255, 205, 82, 69),
      onPressed: () {
        // Navegar a la nueva página al hacer clic en el botón flotante
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SubirDatos()),
        );
      },
      child: Icon(Icons.add),
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
