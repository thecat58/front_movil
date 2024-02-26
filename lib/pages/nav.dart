import 'package:flutter/material.dart';
import 'package:movil/pages/home_screen.dart';
import 'package:movil/pages/login.dart';
import 'package:movil/pages/taller/buscador.dart';
import 'package:movil/pages/taller/vista_taller.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(), // Placeholder para la página de inicio
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
          // Aquí deberías tener tus diferentes páginas representadas por los índices
          // Por ejemplo, HomePage(), SearchPage(), AddPage(), etc.
          HomeScreen(), // Ejemplo de página de inicio
          Container(color: Colors.blue), // Ejemplo de página de búsqueda
          Container(color: Colors.green), // Ejemplo de página de agregar
          const LoginScreen(), // Página de inicio de sesión
          
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
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
    );
  }
}
