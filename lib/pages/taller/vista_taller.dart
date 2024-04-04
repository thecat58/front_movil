import 'package:flutter/material.dart';
import 'package:movil/pages/models/vista_taller.dart';
import 'package:movil/pages/services/s_vista_taller.dart';
import 'package:movil/pages/taller/registrar_taller.dart'; // Importa el servicio de taller

class VistaTaller extends StatefulWidget {
  @override
  _VistaTallerState createState() => _VistaTallerState();
}

class _VistaTallerState extends State<VistaTaller> {
  final TextEditingController _searchController = TextEditingController();
  late List<VistaTallerService> _talleres =
      []; // Inicializamos con una lista vacía

  @override
  void initState() {
    super.initState();
    _loadTalleres();
  }

  Future<void> _loadTalleres() async {
    try {
      List<VistaTallerService> talleres =
          await VistaVistaTallerServiceService.getVistaTallerServices();
      setState(() {
        _talleres = talleres;
      });
    } catch (e) {
      print('Error al cargar talleres: $e');
    }
  }

  Future<void> _refreshTalleres() async {
    await _loadTalleres();
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
            'assets/logoetsa.png',
            width: 50,
            height: 50,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshTalleres,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: '',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
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
              child: ListView.builder(
                itemCount: _talleres.length,
                itemBuilder: (context, index) {
                  final taller = _talleres[index];
                  return _buildSmallCard(
                    taller.fotoUrl,
                    taller.nombre,
                    taller.ubicacion,
                    taller.descripcion,
                    context,
                    taller.id.toString(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 205, 82, 69),
          onPressed: () {
            // Navegar a la nueva página al hacer clic en el botón flotante
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SubirDatos()),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildSmallCard(String imageUrl, String title, String ubicacion,
      String descripcion, BuildContext context, String id) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SubirDatos()),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: imageUrl.isNotEmpty
                      ? NetworkImage(imageUrl)
                      : AssetImage('assets/placeholder_image.jpg')
                          as ImageProvider<Object>,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              ubicacion,
              style: TextStyle(
                  color: const Color.fromARGB(255, 17, 17, 17), fontSize: 14.0),
            ),
            SizedBox(height: 5.0),
            Text(
              descripcion,
              style: TextStyle(
                  color: const Color.fromARGB(255, 17, 17, 17), fontSize: 14.0),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Alinea los botones hacia el centro
              children: [
                ElevatedButton(
                  onPressed: () {
                    _updateTaller(id,
                        context); // Llama a la función para actualizar el taller
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color.fromARGB(255, 205, 82, 69), // Color de fondo
                  ),
                  child: Text(
                    'Actualizar',
                    style: TextStyle(color: Colors.black), // Color del texto
                  ),
                ),
                SizedBox(width: 50), // Ajusta el espacio entre los botones
                ElevatedButton(
                  onPressed: () {
                    _deleteTaller(id,
                        context); // Llama a la función para eliminar el taller
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Color de fondo
                  ),
                  child: Text(
                    'Eliminar',
                    style: TextStyle(color: Colors.black), // Color del texto
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _clearSearchField(BuildContext context) {
    FocusScope.of(context).unfocus();
    _searchController.clear();
  }

  void _updateTaller(String id, BuildContext context) {
    // Lógica para actualizar el taller
  }

// Función para eliminar el taller
  void _deleteTaller(String id, BuildContext context) async {
    try {
      bool confirmarEliminacion = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirmar eliminación'),
            content: Text('¿Estás seguro de que quieres eliminar este taller?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // Cancelar la eliminación
                },
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: () async {
                  // Intentar eliminar el taller utilizando el servicio
                  bool eliminado =
                      await VistaVistaTallerServiceService.deleteTaller(id);
                  Navigator.of(context).pop(
                      eliminado); // Cerrar el diálogo y devolver el resultado
                },
                child: Text('Confirmar'),
              ),
            ],
          );
        },
      );

      // Mostrar un mensaje dependiendo del resultado de la eliminación
      if (confirmarEliminacion != null && confirmarEliminacion) {
        bool eliminado = await VistaVistaTallerServiceService.deleteTaller(id);
        if (eliminado) {
          // El taller se eliminó correctamente
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('El taller se eliminó correctamente'),
              duration: Duration(seconds: 2),
            ),
          );
          await _refreshTalleres(); // Actualizar lista de talleres
        } else {
          // Ocurrió un error al eliminar el taller
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Ocurrió un error al eliminar el taller'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (e) {
      print('Error al eliminar taller: $e');
    }
  }

// Función para actualizar la lista de talleres después de eliminar uno
  // Future<void> _refreshTalleres() async {
  //   setState(() {
  //     _talleresFuture = VistaVistaTallerServiceService.getVistaTallerServices();
  //   });
  // }
}

void main() {
  runApp(MaterialApp(
    home: VistaTaller(),
  ));
}
