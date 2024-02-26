import 'package:flutter/material.dart';


class Buscador extends StatelessWidget {
  final List<String> talleres = [
    'Taller de Reparación de Autos',
    'Taller de Carpintería',
    // Agrega más talleres si es necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Buscar'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate(talleres));
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: talleres.length,
        itemBuilder: (context, index) {
          return TarjetaTaller(
            nombre: talleres[index],
            // Aquí puedes establecer la imagen correspondiente a cada taller
            imagenUrl: 'registro.jpg',
          );
        },
      ),
    );
  }
}

class TarjetaTaller extends StatelessWidget {
  final String nombre;
  final String imagenUrl;

  TarjetaTaller({required this.nombre, required this.imagenUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9, // Proporción de aspecto de la imagen
            child: Image.asset(
              imagenUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              nombre,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

// Clase para manejar la búsqueda
class CustomSearchDelegate extends SearchDelegate {
  final List<String> talleres;

  CustomSearchDelegate(this.talleres);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> foundTalleres = talleres.where((taller) => taller.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: foundTalleres.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(foundTalleres[index]),
          onTap: () {
            // Aquí puedes manejar la acción al seleccionar un resultado de búsqueda
            close(context, foundTalleres[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestedTalleres = talleres.where((taller) => taller.toLowerCase().startsWith(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestedTalleres.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestedTalleres[index]),
          onTap: () {
            // Aquí puedes manejar la acción al seleccionar una sugerencia de búsqueda
            query = suggestedTalleres[index];
            showResults(context);
          },
        );
      },
    );
  }
}
