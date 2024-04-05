import 'package:flutter/material.dart';
import 'package:movil/pages/models/vista_taller.dart';
import 'package:movil/pages/services/s_registro_taller.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'SocialIcons.dart';
import 'package:movil/pages/mapa_taller.dart';

class SubirDatos extends StatefulWidget {
  final VistaTallerService taller; // Agregar parámetro taller

  const SubirDatos({Key? key, required this.taller}) : super(key: key);

  @override
  _SubirDatosState createState() => _SubirDatosState();
}

class _SubirDatosState extends State<SubirDatos> {
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _direccionController = TextEditingController();
  TextEditingController _descripcionController = TextEditingController();

  File? imagenFile;

  @override
  void dispose() {
    _nombreController.dispose();
    _direccionController.dispose();
    _descripcionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'assets/logomovil.png',
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
            _limpiarCampos();
            Navigator.of(context).pop();
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
                  final picker = ImagePicker();
                  final pickedFile =
                      await picker.getImage(source: ImageSource.gallery);

                  if (pickedFile != null) {
                    setState(() {
                      imagenFile = File(pickedFile.path);
                      print(
                          'Ruta de la imagen seleccionada: ${pickedFile.path}');
                    });
                  } else {
                    print('No se seleccionó ninguna imagen.');
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Alerta'),
                          content: Text('No se seleccionó ninguna imagen.'),
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
                  }
                },
                child: Container(
                  width: 350.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 205, 82, 69),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (imagenFile != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.file(
                            imagenFile!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      if (imagenFile == null)
                        Column(
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
                              textAlign: TextAlign.center,
                            ),
                          ],
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
                    buildCustomTextField('Nombre del taller', Icons.business,
                        controller: _nombreController),
                    SizedBox(height: 8.0),
                    buildCustomTextField('Dirección', Icons.location_on,
                        controller: _direccionController),
                    SizedBox(height: 8.0),
                    buildCustomTextField(
                        'Descripción del taller', Icons.description,
                        controller: _descripcionController),
                    SizedBox(height: 16.0),
                    SocialIconsRow(),
                    SizedBox(height: 16),
                    InkWell(
                      onTap: () {
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
                            'Dirección del taller',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
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
            print('Guardar cambios');
            if (imagenFile != null) {
              bool registrado = await TallerService.addTallers(
                imagenFile!,
                _nombreController.text,
                _direccionController.text,
                _descripcionController.text,
              );

              if (registrado) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Datos enviados correctamente.'),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 5),
                  ),
                );

                _limpiarCampos();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Hubo un error al registrar el taller.'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            } else {
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
    );
  }

  Widget buildCustomTextField(String labelText, IconData icon,
      {TextEditingController? controller}) {
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
              controller: controller,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
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

  void _limpiarCampos() {
    _nombreController.clear();
    _direccionController.clear();
    _descripcionController.clear();
    setState(() {
      imagenFile = null;
    });
  }
}
