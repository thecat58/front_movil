import 'package:flutter/material.dart';
import 'package:movil/pages/nav.dart'; // Asegúrate de importar el archivo donde se define CustomBottomNavigationBar

void main() {
  runApp(const MainApp()); // No es necesario el constante para MainApp
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key); // Debes corregir la declaración del constructor

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


// widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Perfil de Usuario"),
//         leading: CircleAvatar(
//           backgroundImage: AssetImage('assets/profile_image.jpg'),
//           radius: 20,
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => MainApp()),
//               );
//             },
//           ),
//         ],
//       ),