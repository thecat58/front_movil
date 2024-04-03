import 'package:flutter/material.dart';
import 'package:movil/pages/services/s_vista_taller.dart';
import 'package:movil/pages/taller/registrar_taller.dart';
import 'package:movil/pages/taller/vista_categorias_taller.dart';
import 'package:movil/pages/models/vista_taller.dart'; // Importa el servicio para obtener los datos del taller

class VistaTaller extends StatefulWidget {
  @override
  _VistaTallerState createState() => _VistaTallerState();
}

class _VistaTallerState extends State<VistaTaller> {
  final TextEditingController _searchController = TextEditingController();
  late Future<List<VistaTallerService>> _talleresFuture;

  @override
  void initState() {
    super.initState();
    _talleresFuture = VistaVistaTallerServiceService.getVistaTallerServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 205, 82, 69),
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Image.asset(
            'assets/logoetsa.png',
            width: 50,
            height: 50,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: '',
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _clearSearchField(context);
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 205, 82, 69),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<VistaTallerService>>(
              future: _talleresFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  List<VistaTallerService>? talleres = snapshot.data;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        ..._buildTallerCards(talleres, context),
                        SizedBox(height: 20),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: BotonFlotante(),
      ),
    );
  }

  Widget _buildSmallCard(String imageUrl, String title, String ubicacion,
      String descripcion, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VistaCategorias()),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: imageUrl.isNotEmpty
                      ? NetworkImage(imageUrl)
                      : AssetImage('assets/placeholder_image.jpg')
                          as ImageProvider<Object>,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              ubicacion,
              style: TextStyle(
                  color: const Color.fromARGB(255, 17, 17, 17), fontSize: 14.0),
            ),
            SizedBox(height: 5.0),
            Text(
              descripcion,
              style: TextStyle(
                  color: const Color.fromARGB(255, 17, 17, 17), fontSize: 14.0),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Alinea los botones hacia el centro
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Acción al presionar el botón "Actualizar"
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color.fromARGB(255, 205, 82, 69), // Color de fondo
                  ),
                  child: Text(
                    'Actualizar',
                    style: TextStyle(color: Colors.black), // Color del texto
                  ),
                ),
                SizedBox(width: 50), // Ajusta el espacio entre los botones
                ElevatedButton(
                  onPressed: () {
                    // Acción al presionar el botón "Eliminar"
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Color de fondo
                  ),
                  child: Text(
                    'Eliminar',
                    style: TextStyle(color: Colors.black), // Color del texto
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTallerCards(
      List<VistaTallerService>? talleres, BuildContext context) {
    if (talleres != null && talleres.isNotEmpty) {
      return talleres.map((taller) {
        return _buildSmallCard(taller.fotoUrl, taller.nombre, taller.ubicacion,
            taller.descripcion, context);
      }).toList();
    } else {
      return [
        Center(
          child: Text('No hay talleres disponibles.'),
        )
      ];
    }
  }

  void _clearSearchField(BuildContext context) {
    FocusScope.of(context).unfocus();
    _searchController.clear();
  }
}

class BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color.fromARGB(255, 205, 82, 69),
      onPressed: () {
        // Navegar a la nueva página al hacer clic en el botón flotante
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SubirDatos()),
        );
      },
      child: Icon(Icons.add),
    );
  }
}
