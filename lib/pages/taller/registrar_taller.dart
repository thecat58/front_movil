import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movil/pages/mapa_taller.dart';
import 'package:movil/pages/services/s_registro_taller.dart';
import 'package:movil/pages/models/registro_taller.dart';
import 'dart:io'; // Importa dart:io para usar la clase File
import 'package:http/http.dart' as http;

void main() => runApp(const SubirDatos());

class SubirDatos extends StatelessWidget {
  const SubirDatos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String nombre = '';
    String direccion = '';
    String descripcion = '';
    File? imagenFile; // Declara imagenFile como un objeto File nullable

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 205, 82, 69),
          centerTitle: true,
          title: Column(
            children: [
              Container(
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
              SizedBox(height: 8.0),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(); // Devuelve a la pantalla anterior
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 16.0),
                Text(
                  'REGISTRAR TALLER',
                  style: TextStyle(color: Colors.black87),
                ),
                SizedBox(height: 8.0),
                InkWell(
                  onTap: () async {
                    print('Botón de subir imagen presionado');
                    // Llama a la función para seleccionar una imagen
                    final picker = ImagePicker();
                    final pickedFile = await picker.getImage(source: ImageSource.gallery);

                    if (pickedFile != null) {
                      imagenFile = File(pickedFile.path); // Crea un objeto File
                      print('Ruta de la imagen seleccionada: ${pickedFile.path}');
                    } else {
                      print('No se seleccionó ninguna imagen.');
                    }
                  },
                  child: Container(
                    width: 350.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 205, 82, 69),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_upload,
                          color: Colors.white,
                          size: 90.0,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Subir imagen del taller',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  width: 350.0,
                  child: Column(
                    children: [
                      buildCustomTextField('Nombre del taller', Icons.business, onChanged: (value) => nombre = value),
                      SizedBox(height: 8.0),
                      buildCustomTextField('Dirección', Icons.location_on, onChanged: (value) => direccion = value),
                      SizedBox(height: 8.0),
                      buildCustomTextField('Descripción del taller', Icons.description, onChanged: (value) => descripcion = value),
                      SizedBox(height: 8.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Contáctanos',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      SizedBox(height: 16.0),
                      InkWell(
                        onTap: () {
                          // Navegar a la página MapScreen2
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapScreen2(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/ubicacion.png',
                              width: 60,
                              height: 60,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Dirección del taller', // Aquí colocas la dirección del taller
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(right: 5.0, bottom: 1),
          child: FloatingActionButton.extended(
            onPressed: () async {
              // Acción al presionar el botón de guardar cambios
              print('Guardar cambios');
              // Verifica si imagenFile no es nulo
              if (imagenFile != null) {
                // Llamar al servicio para registrar el taller
                bool registrado = await TallerService.addTallers(
                  imagenFile!, // Usa ! para asegurarte de que no sea nulo
                  nombre,
                  direccion,
                  descripcion,
                );

                if (registrado) {
                  // Mostrar un mensaje de éxito
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Éxito'),
                        content: Text('Los datos fueron guardados correctamente.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Aceptar'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // Mostrar un mensaje de error
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Hubo un error al registrar el taller.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              } else {
                // Mostrar un mensaje de error si imagenFile es nulo
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Debes seleccionar una imagen del taller.'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            icon: Icon(Icons.add, color: Colors.black),
            label: Text(
              'Guardar cambios',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Color.fromARGB(255, 205, 82, 69),
          ),
        ),
      ),
    );
  }

  Widget buildCustomTextField(String labelText, IconData icon, {int maxLines = 1, Function(String)? onChanged}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: TextFormField(
              maxLines: maxLines,
              onChanged: onChanged,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                labelText: labelText,
                labelStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                hoverColor: Colors.transparent,
                fillColor: Colors.transparent,
                focusColor: Colors.transparent,
              ),
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
