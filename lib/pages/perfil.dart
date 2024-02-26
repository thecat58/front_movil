import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:movil/main.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfile();
}

class _UserProfile extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainApp()),
            );
          },
        ),
        title: Text('Perfil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
             child: Stack(
          alignment: Alignment.center,
          children: [
            // Contenedor para la imagen de fondo
            Container(
              width: 820, // Ancho del contenedor
              height: 320, // Altura del contenedor
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('registro.jpg'), // Ruta de la imagen de fondo
                  fit: BoxFit.cover, // Ajustar la imagen para cubrir todo el contenedor
                ),
                borderRadius: BorderRadius.circular(10), // Borde redondeado del contenedor
              ),
            ),
                  Container(
                    padding: const EdgeInsets.only(top: 130),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 55,
                      child: CircleAvatar(
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 50, left: 88),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 10,
                                child: Center(
                                  child: Icon(
                                      color: Colors.black,
                                      Icons.edit,
                                      size: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                        backgroundImage: AssetImage('logo.jpg'),
                        radius: 49,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'SOLO CULOS',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          '2',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Text(
                        'Talleres',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 15),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text(
                          '0',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          'Opiniones',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          '555',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          'Likes',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 15),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 380,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
                child: const Column(
                  children: [
                    ListTile(
                      title: Text(
                        'nombre',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      subtitle: Text(
                        'cargo',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    ListTile(
                      title: Text(
                        'nombre',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      subtitle: Text(
                        'cargo',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    ListTile(
                      title: Text(
                        'nombre',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      subtitle: Text(
                        'cargo',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    ListTile(
                      title: Text(
                        'nombre',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      subtitle: Text(
                        'cargo',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
