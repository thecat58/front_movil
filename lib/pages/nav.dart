import 'package:flutter/material.dart';
import 'package:movil/pages/home_screen.dart';
import 'package:movil/pages/maps_screen.dart';
import 'package:movil/pages/perfil.dart';
import 'package:movil/pages/taller/vista_taller.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    VistaTaller(),
    MapScreen(), // Placeholder para la página de agregar
    UserProfile(), // Página de inicio de sesión
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Cambia el color de fondo del Scaffold
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: _pages,
          ),
        ],
      ),
      bottomNavigationBar: buildCustomBottomNavigationBar(_selectedIndex, _onItemTapped), // Llama a la función aquí
    );
  }
}

BottomNavigationBar buildCustomBottomNavigationBar(int selectedIndex, Function(int) onItemTapped) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: selectedIndex, // Utiliza el valor pasado como parámetro
    onTap: onItemTapped, // Utiliza la función pasada como parámetro
    backgroundColor: Colors.grey, // Cambia el color de fondo del BottomNavigationBar
    selectedItemColor: Colors.white, // Cambia el color del ícono y el texto seleccionados
    unselectedItemColor: Color.fromARGB(255, 205, 82, 69), // Cambia el color del ícono y el texto no seleccionados
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Inicio',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.handyman_outlined),
        label: 'Talleres',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.map),
        label: 'Buscador',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        label: 'Perfil',
      ),
    ],
  );
}
