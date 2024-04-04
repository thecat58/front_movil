import 'package:flutter/material.dart';
import 'package:movil/pages/models/vista_taller.dart';
import 'package:movil/pages/services/s_vista_taller.dart';

class ActualizarTallerPage extends StatefulWidget {
  final String id;
  final VistaTallerService taller;

  const ActualizarTallerPage({Key? key, required this.id, required this.taller})
      : super(key: key);

  @override
  _ActualizarTallerPageState createState() => _ActualizarTallerPageState();
}

class _ActualizarTallerPageState extends State<ActualizarTallerPage> {
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _direccionController = TextEditingController();
  TextEditingController _descripcionController = TextEditingController();

  late List<VistaTallerService> _talleres = []; // Lista de talleres

  @override
  void initState() {
    super.initState();
    _loadTalleres(); // Cargar la lista de talleres al iniciar la página
  }

  Future<void> _loadTalleres() async {
    try {
      // Obtener la lista de talleres desde el servicio de talleres
      List<VistaTallerService> talleres =
          await VistaVistaTallerServiceService.obtenerTalleres();
      setState(() {
        _talleres = talleres;
      });
    } catch (e) {
      print('Error al cargar talleres: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actualizar Taller'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nombreController,
              decoration: InputDecoration(labelText: 'Nombre del taller'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _direccionController,
              decoration: InputDecoration(labelText: 'Dirección'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _descripcionController,
              decoration: InputDecoration(labelText: 'Descripción del taller'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _actualizarTaller(); // Llamar al método para actualizar el taller
              },
              child: Text('Guardar cambios'),
            ),
          ],
        ),
      ),
    );
  }

  void _actualizarTaller() {
    try {
      // Verificar si el taller existe en la lista _talleres
      VistaTallerService? taller = _talleres.firstWhere(
        (t) => t.id == int.parse(widget.id),
        orElse: () {
          print('Taller no encontrado.');
          return VistaTallerService(
            id: 0, // Puedes establecer cualquier valor predeterminado para el ID
            nombre: '', // Valor predeterminado para el nombre
            ubicacion: '', // Valor predeterminado para la ubicación
            descripcion: '', // Valor predeterminado para la descripción
            fotoUrl: '', // Valor predeterminado para la URL de la foto
          );
        },
      );

      // Implementar lógica para actualizar el taller
      // (Reemplaza este bloque con tu lógica de actualización)
      print('Taller encontrado. Actualizando...');
    } catch (e) {
      print('Error al actualizar el taller: $e');
      // Manejar el error de alguna manera si es necesario
    }
  }
}
