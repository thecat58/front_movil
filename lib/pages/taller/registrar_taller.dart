import 'package:flutter/material.dart';

void main() => runApp(const SubirDatos());

class SubirDatos extends StatelessWidget {
  const SubirDatos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: Center(
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
                onTap: () {
                  print('Botón de subir imagen presionado');
                },
                child: Container(
                  width: 290.0,
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
                        color: Colors.black,
                        size: 60.0,
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
                width: 290.0,
                child: Column(
                  children: [
                    buildCustomTextField('Nombre del taller', Icons.business),
                    SizedBox(height: 8.0),
                    buildCustomTextField('Categoría', Icons.category),
                    SizedBox(height: 8.0),
                    buildCustomTextField(
                        'Descripción del taller', Icons.description),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.facebook),
                          onPressed: () {
                            // Abrir enlace de Facebook
                            print('Abrir enlace de Facebook');
                          },
                        ),
                        IconButton(
                          icon: InkWell(
                            onTap: () {
                              // Acción al presionar el botón de Instagram
                              print('Abrir enlace de Instagram');
                            },
                            child: Image.asset(
                              'assets/instagram_icon.png',
                              width: 40, // Mismo ancho que los otros iconos
                              height: 40, // Mismo alto que los otros iconos
                            ),
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: InkWell(
                            onTap: () {
                              // Acción al presionar el botón de WhatsApp
                              print('Abrir enlace de WhatsApp');
                            },
                            child: Image.asset(
                              'assets/whatsapp.png',
                              width: 40, // Mismo ancho que los otros iconos
                              height: 40, // Mismo alto que los otros iconos
                            ),
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: InkWell(
                            onTap: () {
                              // Acción al presionar el botón de WhatsApp
                              print('Abrir enlace de tiktok');
                            },
                            child: Image.asset(
                              'assets/tiktok.png',
                              width: 40, // Mismo ancho que los otros iconos
                              height: 40, // Mismo alto que los otros iconos
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCustomTextField(String labelText, IconData icon,
      {int maxLines = 1}) {
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
}


