import 'package:flutter/material.dart';
import 'package:movil/pages/taller/descripcion_ralle.dart';
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
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 205, 82, 69),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20), // Espacio hacia abajo
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0), // Padding ajustado
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildSmallCard('assets/imgcateg1.png', 'Mantenimiento general', Colors.red),
                        _buildSmallCard('assets/imgcateg3.png', 'Neumáticos y Ruedas', Colors.grey),
                        _buildSmallCard('assets/imgcateg1.png', 'Mantenimiento general', Colors.red),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0), // Padding ajustado
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildSmallCard('assets/imgcateg1.png', 'Mantenimiento general', Colors.grey),
                        _buildSmallCard('assets/imgcateg3.png', 'Neumáticos y Ruedas', Colors.red),
                        _buildSmallCard('assets/imgcateg1.png', 'Mantenimiento general', Colors.grey),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0), // Padding ajustado
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildSmallCard('assets/imgcateg1.png', 'Mantenimiento general', Colors.red),
                        _buildSmallCard('assets/imgcateg3.png', 'Neumáticos y Ruedas', Colors.grey),
                        _buildSmallCard('assets/imgcateg1.png', 'Mantenimiento general', Colors.red),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // Espacio hacia abajo
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: BotonFlotante(),
      ),
    );
  }

  Widget _buildSmallCard(String imagePath, String title, Color color) {
    return Container(
      width: 100.0, // Ajuste de ancho
      height: 150.0, // Ajuste de alto
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 80.0, // Tamaño de la imagen ajustado
            height: 80.0, // Tamaño de la imagen ajustado
          ),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 12), // Tamaño de fuente ajustado
            textAlign: TextAlign.center,
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
