import 'package:flutter/material.dart';

void main() => runApp(const SubirDatos());

class SubirDatos extends StatelessWidget {
  const SubirDatos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Cambiado a MaterialApp para envolver Scaffold
    debugShowCheckedModeBanner: false, // Oculta la marca de depuración

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
              SizedBox(height: 8.0), // Espacio entre el logo y el texto
            ],
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
                    ElevatedButton(
                      onPressed: () {
                        print('Botón Nombre del taller presionado');
                      },
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        shadowColor: Colors.black,
                        elevation: 4,
                        minimumSize: Size(double.infinity, 50.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text('Nombre del taller', style: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        print('Botón Categoría presionado');
                      },
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        shadowColor: Colors.black,
                        elevation: 4,
                        minimumSize: Size(double.infinity, 50.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text('Categoría', style: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        print('Botón Descripción del taller presionado');
                      },
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        shadowColor: Colors.black,
                        elevation: 4,
                        minimumSize: Size(double.infinity, 50.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text('Descripción del taller', style: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(height: 16.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Contactos',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
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
}
