import 'package:flutter/material.dart';

class VistaCategorias extends StatelessWidget {
  // Controlador de texto para el campo de búsqueda
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Campo de búsqueda
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: TextField(
                controller: _searchController, // Asignar el controlador de texto
                decoration: InputDecoration(
                  hintText: '',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      // Borrar el texto del campo de búsqueda
                      _searchController.clear();
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 205, 82, 69),
                      width: 2.0,
                    ),
                  ),
                  // Definir el color del borde cuando el campo está enfocado
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 205, 82, 69), // Color del borde al estar enfocado
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10), // Espaciador vertical
            _buildFirstCard(), // Llamada al método para construir la primera tarjeta
            SizedBox(height: 10), // Espaciador vertical
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Talleres afines:',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 10), // Espaciador vertical
            _buildCardWithIcon(), // Llamada al método para construir la primera tarjeta con icono
            SizedBox(height: 10), // Espaciador vertical
            _buildCardWithIcon(), // Llamada al método para construir una tarjeta
            SizedBox(height: 10), // Espaciador vertical
            _buildCardWithIcon(), // Llamada al método para construir una tarjeta
          ],
        ),
      ),
    );
  }

  // Método para construir la primera tarjeta con imagen y texto a la derecha
  Widget _buildFirstCard() {
    return Card(
      color: Color.fromARGB(255, 205, 82, 69),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            // Imagen a la izquierda
            Expanded(
              flex: 1,
              child: Image.asset(
                'assets/imgcateg1.png',
                width: 64,
                height: 64,
              ),
            ),
            // Texto a la derecha
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Mantenimiento General',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir la tarjeta con icono
  Widget _buildCardWithIcon() {
    return Card(
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Imagen centrada a la izquierda
            Expanded(
              flex: 1,
              child: Center(
                child: Image.asset(
                  'assets/imgcateg3.png',
                  width: 64, // Tamaño de la imagen
                  height: 64, // Tamaño de la imagen
                ),
              ),
            ),
            // Texto y descripción
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Centrar el texto horizontalmente
                children: [
                  Text(
                    'ServiMec',
                    style: TextStyle(
                      color: Colors.black, // Establecer el color del texto a negro
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Donde la excelencia mecánica se convierte en arte para mantener tu vehículo en su mejor forma.',
                    textAlign: TextAlign.center, // Centrar el texto horizontalmente
                    style: TextStyle(
                      color: Colors.black, // Establecer el color del texto a negro
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget _buildCard() {
    return Card(
      color: Color.fromARGB(255, 205, 82, 69),
      child: SizedBox(
        width: 110,
        height: 120,
        child: Center(
          child: Text(
            'Tu contenido aquí',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: VistaCategorias(),
  ));
}
