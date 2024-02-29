import 'package:flutter/material.dart';
import 'package:movil/pages/nav.dart'; // Asegúrate de importar el archivo donde se define CustomBottomNavigationBar

void main() {
  runApp(MainApp()); // No es necesario el constante para MainApp
}

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key); // Debes corregir la declaración del constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Elimina el constante para MaterialApp
      debugShowCheckedModeBanner: false, // Oculta la marca de depuración
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Instagram Menu Inferior'), // Añade un AppBar
        ),
        body: const Center(
          child: Text('Hello World!'),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(), // Llamada al menú inferior personalizado
      ),
    );
  }
}