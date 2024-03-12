import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movil/pages/nav.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();

  Future<void> login(String usuario, String contrasena) async {
    try {
      http.Response response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/login/'),
        body: {
          'email': usuario,
          'password': contrasena, // Corregir la clave de la contraseña
        },
      );

      if (response.statusCode == 200) {
        print('cuenta creada');
        // Aquí podrías realizar otras acciones, como navegar a una nueva pantalla
      } else {
        print('Error en la solicitud: ${response.statusCode}');
        // Manejo de errores: podrías mostrar un diálogo de error al usuario
      }
    } catch (e) {
      print('Error en la solicitud: $e');
      // Manejo de errores: podrías mostrar un diálogo de error al usuario
    }
  }

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo(context),
    );
  }

  Widget cuerpo(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/login.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Color.fromARGB(255, 188, 187, 187).withOpacity(0.5),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              logo(),
              SizedBox(height: 20),
              nombre(),
              campoUsuario(),
              campoPassword(),
              botonEntrar(context),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton.icon(
                    onPressed: () {
                      // Acción al presionar el botón de registro con Facebook
                    },
                    icon: Icon(
                      Icons.facebook,
                      size: 50,
                      color: Colors.blue,
                    ),
                    label: Text(""),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Acción al presionar el botón de registro con Google
                    },
                    icon: Icon(
                      Icons.g_mobiledata,
                      size: 50,
                      color: Colors.red,
                    ),
                    label: Text(""),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget logo() {
    return Positioned(
      top: 20,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          image: DecorationImage(
            image: AssetImage('assets/logo.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget nombre() {
    return Text("Iniciar sesión ",
        style: TextStyle(
            color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold));
  }

  Widget campoUsuario() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      child: Container(
        width: 300,
        child: TextField(
          controller: usuarioController,
          style: TextStyle(fontSize: 25),
          decoration: InputDecoration(
            hintText: "Usuario",
            fillColor: Colors.white,
            suffixIcon: Icon(Icons.person),
            contentPadding: EdgeInsets.symmetric(vertical: 15),
            alignLabelWithHint: true,
          ),
        ),
      ),
    );
  }

  Widget campoPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      child: Container(
        width: 300,
        child: TextField(
          controller: contrasenaController,
          obscureText: true,
          style: TextStyle(fontSize: 25),
          decoration: InputDecoration(
            hintText: "Contraseña",
            fillColor: Colors.white,
            suffixIcon: Icon(Icons.no_encryption_sharp),
            contentPadding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }

  Widget botonEntrar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: TextButton(
        onPressed: () {
          login(usuarioController.text.toString(),
              contrasenaController.text.toString());
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => CustomBottomNavigationBar()),
          );
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Color(0xFF3E485D),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          textStyle: const TextStyle(fontSize: 20),
        ),
        child: Text("Iniciar"),
      ),
    );
  }
}
