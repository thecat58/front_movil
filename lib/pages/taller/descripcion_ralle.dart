import 'package:flutter/material.dart';
import 'package:movil/pages/mapa_taller.dart';

class Vista_Taller extends StatefulWidget {
  @override
  _VistaTallerState createState() => _VistaTallerState();
}

class _VistaTallerState extends State<Vista_Taller> {
  bool isExpanded = false; // Estado para controlar la expansión del texto

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
            'assets/logo.png',
            width: 50,
            height: 50,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Título',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            // Imagen
            SizedBox(
              width: double.infinity,
              height: 320, // Altura fija de la imagen
              child: Image.asset(
                'assets/imgcarro2.png', // Ruta de la imagen
                fit: BoxFit
                    .cover, // Ajusta el tamaño de la imagen para cubrir el espacio
              ),
            ),
            SizedBox(height: 20.0),
            // Texto expandible
            _buildExpandableText(
                'Descubre el arte de solo aseite en nuestro taller intensivo, diseñado para entusiastas de todos los niveles. Sumérgete en una experiencia única, donde la creatividad y el aprendizaje se fusionan a través de sesiones prácticas y teóricas, guiadas por expertos apasionados. Con todo el material proporcionado, este taller te equipará con las habilidades y conocimientos necesarios para llevar tu pasión al siguiente nivel. Desde conceptos básicos hasta técnicas avanzadas, cada sesión está cuidadosamente estructurada para maximizar tu potencial creativo. Únete a nosotros en esta aventura de aprendizaje, donde cada participante terminará con una obra completa y la confianza para seguir explorando su talento. Ideal para quienes buscan profundizar en [temática del taller], este taller no solo es una inversión en tu desarrollo personal, sino también una oportunidad para formar parte de una comunidad de creativos afines.'),
            SizedBox(height: 20.0),
            // Iconos
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.facebook),
                  iconSize: 54.0, // Tamaño del icono
                  onPressed: () {},
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/instagram_icon.png',
                    width: 54.0,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 20.0),
            // Imagen de Google Maps
           GestureDetector(
              onTap: () {
                // Navega a MapScreen2 cuando se presiona la imagen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapScreen2()),
                );
              },
              child: Image.network(
                'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/media/image/2023/02/google-maps-2961754.jpg?tf=1080x',
                // width: 54.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableText(String text) {
    final lineLimit = 3; // Limita el texto a 3 líneas inicialmente

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 16.0),
          maxLines: isExpanded ? null : lineLimit,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
        InkWell(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isExpanded ? 'Ver menos' : 'Ver más',
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
              Icon(
                isExpanded ? Icons.expand_less : Icons.expand_more,
                color: Colors.blue,
              ),
            ],
          ),
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(home: Vista_Taller()));
}
