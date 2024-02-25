import 'package:flutter/material.dart';
import 'package:movil/pages/login.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  // Lista de rutas
  final List<String> _pageRoutes = [
    '/home',
    '/search',
    '/add',
    '/login',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    
    // Si la opción seleccionada es la de login, navega a la ruta '/login'
    if (_pageRoutes[index] == '/login') {
      navigateToRoute(_pageRoutes[index]);
    }
  }

  void navigateToRoute(String route) {
    // Utiliza Navigator.pushNamed para navegar a la ruta especificada
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // Aquí deberías tener tus diferentes páginas representadas por los índices
          // Por ejemplo, HomePage(), SearchPage(), AddPage(), etc.
          Container(color: Colors.red), // Ejemplo de página de inicio
          Container(color: Colors.blue), // Ejemplo de página de búsqueda
          Container(color: Colors.green), // Ejemplo de página de agregar
          LoginScreen(), // Página de inicio de sesión
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
    );
  }
}
