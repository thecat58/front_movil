import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:movil/pages/taller/descripcion_ralle.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<String> images = [
    'assets/imgprin1.png',
    'assets/imgprin2.png',
    'assets/imgprin3.png',
  ];

  final List<TallerInfo> talleres = [
    TallerInfo('assets/imgtarj1.png', 'Servimec',
        'Servicio de reparación eléctrica', 'Aceptamos todo tipo de vehículos'),
    TallerInfo(
        'assets/imgtaj2.png',
        'Reparauto',
        'Especialistas en reparación de carrocería',
        'Trabajos rápidos y garantizados'),
    TallerInfo('assets/imgtarj3.png', 'Mecatriz ',
        'Reparación y mantenimiento mecánico', 'Personal altamente capacitado'),
  ];

  final List<String> secondCarouselImages = [
    'assets/imgcarro1.png',
    'assets/imgcarro2.png',
    'assets/imgcarro3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/logo.png',
                  width: 40,
                  height: 40,
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Buscar...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.red,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Center(
                child: Text(
                  '¡Nuestros servicios!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildSmallCard('assets/imgcateg1.png',
                          'Mantenimiento general', Colors.red),
                      _buildSmallCard('assets/imgcateg2.png',
                          'Reparaciones Mecanicas', Colors.grey),
                      _buildSmallCard('assets/imgcateg3.png',
                          'Neumáticos y Ruedas', Colors.red),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        print('Presionaste Ver Más');
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Text(
                          'Ver Más...',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: talleres.map((taller) {
                  return InkWell(
                    onTap: () {
                      // Navega a la vista del taller cuando se toca la tarjeta
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Vista_Taller()),
                      );
                      print('Tocaste la tarjeta ${taller.nombre}');
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
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.asset(
                              taller.image,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    taller.servicios,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
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

  Widget _buildSmallCard(
      String imagePath, String description, Color backgroundColor) {
    return Container(
      width: 80,
      height: 120,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
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
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 70,
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
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
