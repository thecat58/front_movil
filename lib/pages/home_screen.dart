import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<String> images = [
    'imgprin1.png',
    'imgprin2.png',
    'imgprin3.png',
  ];

  final List<TallerInfo> talleres = [
    TallerInfo('imgtarj1.png', 'Taller Eléctrico', 'Servicio de reparación eléctrica', 'Aceptamos todo tipo de vehículos'),
    TallerInfo('imgtaj2.png', 'Taller Mecánico', 'Especialistas en reparación de carrocería', 'Trabajos rápidos y garantizados'),
    TallerInfo('imgtarj3.png', 'Taller de Lamina y Pintura', 'Reparación y mantenimiento mecánico', 'Personal altamente capacitado'),
  ];

  final List<String> secondCarouselImages = [
    'imgcarro1.png',
    'imgcarro2.png',
    'imgcarro3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        backgroundColor: Colors.red,
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'logo.png',
              width: 40,
              height: 40,
            ),
            
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Contenedor para el carrusel de imágenes principal
            SizedBox(
              height: 250,
              child: Swiper(
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                itemCount: images.length,
                pagination: const SwiperPagination(),
                control: const SwiperControl(),
              ),
            ),
            // Contenedor blanco con texto de bienvenida
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Center(
                child: Text(
                  '¡Bienvenidos!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            // Contenedor con imagen y texto
            Container(
              color: Colors.red,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Contenedor para la imagen (parte derecha)
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('imgoferta1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Contenedor para el texto (parte izquierda)
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: const Center(
                        child: Text(
                          'Ofertas solo por 24 horas',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Tarjetas en la parte inferior
            Container(
              color: Colors.white,
              child: Column(
                children: talleres.map((taller) {
                  return InkWell(
                    onTap: () {
                      // Acción al tocar la tarjeta (puedes cambiar esto según tus necesidades)

                    },
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            taller.image,
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            taller.nombre,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            taller.descripcion,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            taller.servicios,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            // Contenedor para el segundo carrusel de imágenes
            SizedBox(
              height: 150,
              child: Swiper(
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        secondCarouselImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                itemCount: secondCarouselImages.length,
                pagination: const SwiperPagination(),
                control: const SwiperControl(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TallerInfo {
  final String image;
  final String nombre;
  final String descripcion;
  final String servicios;

  TallerInfo(this.image, this.nombre, this.descripcion, this.servicios);
}
