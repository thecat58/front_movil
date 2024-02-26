import 'package:flutter/material.dart';
import 'package:movil/pages/login.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Container(color: Colors.white24), // Placeholder para la página de inicio
    Container(color: Colors.blue), // Placeholder para la página de búsqueda
    Container(color: Colors.green), // Placeholder para la página de agregar
    LoginScreen(), // Página de inicio de sesión
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              backgroundColor: Colors.grey, // Cambia el color de fondo del BottomNavigationBar
              selectedItemColor: Colors.white, // Cambia el color del ícono y el texto seleccionados
              unselectedItemColor:  Color.fromARGB(255, 205, 82, 69), // Cambia el color del ícono y el texto no seleccionados
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Inicio',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Buscar',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_box),
                  label: 'Agregar',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: 'Perfil',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
