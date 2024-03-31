import 'package:flutter/material.dart';
import 'package:movil/pages/models/vista_taller.dart'; // Importa el modelo VistaTallerService
import 'package:movil/pages/services/s_vista_taller.dart'; // Importa el servicio VistaTallerServiceService

class VistaCategorias extends StatefulWidget {
  @override
  _VistaCategoriasState createState() => _VistaCategoriasState();
}

class _VistaCategoriasState extends State<VistaCategorias> {
  final TextEditingController _searchController = TextEditingController();
  List<VistaTallerService> talleres = []; // Lista para almacenar los talleres

  @override
  void initState() {
    super.initState();
    _fetchTalleres(); // Llama al método para obtener los talleres al inicializar el widget
  }

  // Método para obtener los talleres desde el servidor
  void _fetchTalleres() async {
    try {
      List<VistaTallerService> listaTalleres =
          await VistaVistaTallerServiceService.getVistaTallerServices();
      setState(() {
        talleres =
            listaTalleres; // Actualiza el estado con los talleres obtenidos del servidor
      });
    } catch (e) {
      print('Error al cargar talleres: $e');
    }
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
            'assets/logomovil.png',
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
                controller:
                    _searchController, // Asignar el controlador de texto
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
                      color: Color.fromARGB(255, 205, 82,
                          69), // Color del borde al estar enfocado
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10), // Espaciador vertical
            // Construir las tarjetas dinámicamente con los datos obtenidos del servidor
            for (var taller in talleres) _buildTallerCard(taller),
          ],
        ),
      ),
    );
  }

  // Método para construir las tarjetas de talleres
  Widget _buildTallerCard(VistaTallerService taller) {
    return Card(
      color: Color.fromARGB(255, 205, 82, 69),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      NetworkImage(taller.fotoUrl), // URL de la foto del taller
                ),
              ),
            ),
            SizedBox(width: 10), // Espacio entre la imagen y el texto
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0), // Ajuste del margen izquierdo del texto
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ID: ${taller.id}', // ID del taller
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Nombre: ${taller.nombre}', // Nombre del taller
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Ubicación: ${taller.ubicacion}', // Ubicación del taller
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Descripción: ${taller.descripcion}', // Descripción del taller
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
