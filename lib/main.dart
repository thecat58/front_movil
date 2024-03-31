import 'package:flutter/material.dart';
import 'package:movil/pages/login.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(), // Mostrar LoginPage como pantalla de inicio
    );
  }
}
