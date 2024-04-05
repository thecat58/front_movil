import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movil/pages/models/vista_taller.dart';
import 'package:movil/pages/services/s_vista_taller.dart';

class VistaTaller extends StatefulWidget {
  @override
  _VistaTallerState createState() => _VistaTallerState();
}

class _VistaTallerState extends State<VistaTaller> {
  TextEditingController _searchController = TextEditingController();

  List<VistaTallerService> _talleres = [];

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
                    taller,
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
            // Abre la pantalla de subir datos pasando el primer taller de la lista
            _showUpdateDialog(context, _talleres.first);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildSmallCard(
    String imageUrl,
    String title,
    String ubicacion,
    String descripcion,
    BuildContext context,
    String id,
    VistaTallerService taller,
  ) {
    return GestureDetector(
      onTap: () {
        // Abre la pantalla de edición y pasa el objeto del taller
        _showUpdateDialog(context, taller);
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showUpdateDialog(context, taller);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 205, 82, 69),
                  ),
                  child: Text(
                    'Actualizar',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(width: 50),
                ElevatedButton(
                  onPressed: () {
                    _deleteTaller(id, context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Text(
                    'Eliminar',
                    style: TextStyle(color: Colors.black),
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
                  Navigator.of(context).pop(false);
                },
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: () async {
                  bool eliminado =
                      await VistaVistaTallerServiceService.deleteTaller(id);
                  Navigator.of(context).pop(eliminado);
                },
                child: Text('Confirmar'),
              ),
            ],
          );
        },
      );

      if (confirmarEliminacion != null && confirmarEliminacion) {
        bool eliminado = await VistaVistaTallerServiceService.deleteTaller(id);
        if (eliminado) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('El taller se eliminó correctamente'),
              duration: Duration(seconds: 2),
            ),
          );
          await _refreshTalleres();
        } else {
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

  void _showUpdateDialog(BuildContext context, VistaTallerService taller) {
    TextEditingController nombreController =
        TextEditingController(text: taller.nombre ?? '');
    TextEditingController ubicacionController =
        TextEditingController(text: taller.ubicacion ?? '');
    TextEditingController descripcionController =
        TextEditingController(text: taller.descripcion ?? '');

    File? _image;

    Future<void> _pickImage() async {
      final pickedImage =
          await ImagePicker().getImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _image = File(pickedImage.path);
        });
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Actualizar Taller'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Seleccionar imagen'),
              ),
              TextField(
                controller: nombreController,
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: ubicacionController,
                decoration: InputDecoration(labelText: 'Ubicación'),
              ),
              TextField(
                controller: descripcionController,
                decoration: InputDecoration(labelText: 'Descripción'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                String imageUrl = taller.fotoUrl ?? '';
                if (_image != null) {
                  imageUrl = await _uploadImageToServer(_image!);
                }
                bool actualizado =
                    await VistaVistaTallerServiceService.actualizarTaller(
                  taller.id.toString(),
                  nombreController.text,
                  ubicacionController.text,
                  descripcionController.text,
                  imageUrl,
                );
                if (actualizado) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('El taller se actualizó correctamente'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  await _refreshTalleres();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Ocurrió un error al actualizar el taller'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }

                Navigator.of(context).pop();
              },
              child: Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  Future<String> _uploadImageToServer(File imageFile) async {
    // Lógica para subir la imagen al servidor y obtener la URL
    // Implementa tu lógica de subida de imagen aquí
    return ''; // URL de ejemplo
  }
}

void main() {
  runApp(MaterialApp(
    home: VistaTaller(),
  ));
}
