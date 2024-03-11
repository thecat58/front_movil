import 'package:flutter/material.dart';
import 'package:movil/pages/taller/descripcion_ralle.dart';
import 'package:movil/pages/taller/registrar_taller.dart';
import 'package:movil/pages/taller/vista_categorias_taller.dart'; // Importa la página VistaCategorias

class VistaTaller extends StatelessWidget {
  // Definir un controlador de texto para el campo de búsqueda
  final TextEditingController _searchController = TextEditingController();

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
          // Campo de búsqueda
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0), // Ajuste de margen
            child: TextField(
              controller: _searchController, // Asignar el controlador de texto
              decoration: InputDecoration(
                hintText: '',
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    // Cerrar el teclado y borrar el texto del campo de búsqueda
                    _clearSearchField(context);
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
                  SizedBox(height: 5), // Espacio hacia abajo
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 8.0), // Padding ajustado
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildSmallCard('assets/imgcateg1.png', 'Mantenimiento general', Colors.red, context),
                        _buildSmallCard('assets/imgcateg3.png', 'Neumáticos y Ruedas', Colors.grey, context),
                        _buildSmallCard('assets/imgcateg1.png', 'Lavado de autos', Colors.red, context),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 8.0), // Padding ajustado
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildSmallCard('assets/imgcateg1.png', 'Reparación de frenos', Colors.grey, context),
                        _buildSmallCard('assets/imgcateg3.png', 'Cambio de neumáticos', Colors.red, context),
                        _buildSmallCard('assets/imgcateg1.png', 'Mantenimiento eléctrico', Colors.grey, context),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 8.0), // Padding ajustado
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildSmallCard('assets/imgcateg1.png', 'Revisión de motor', Colors.red, context),
                        _buildSmallCard('assets/imgcateg3.png', 'Reparación de transmisión', Colors.grey, context),
                        _buildSmallCard('assets/imgcateg1.png', 'Limpieza de inyectores', Colors.red, context),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 8.0), // Padding ajustado
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildSmallCard('assets/imgcateg1.png', 'Revisión de motor', Colors.red, context),
                        _buildSmallCard('assets/imgcateg3.png', 'Reparación de transmisión', Colors.grey, context),
                        _buildSmallCard('assets/imgcateg1.png', 'Limpieza de inyectores', Colors.red, context),
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

  // Función para construir las tarjetas
  Widget _buildSmallCard(String imagePath, String title, Color color, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navega a la página VistaCategorias
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VistaCategorias()),
        );
      },
      child: Container(
        width: 120.0, // Ajuste de ancho
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
      ),
    );
  }

  // Función para cerrar el teclado y borrar el texto del campo de búsqueda
  void _clearSearchField(BuildContext context) {
    // Cerrar el teclado
    FocusScope.of(context).unfocus();
    // Borrar el texto del campo de búsqueda
    _searchController.clear();
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
