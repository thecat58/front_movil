import 'package:flutter/material.dart';
import 'package:movil/pages/perfil.dart';
import 'package:movil/pages/rejister.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
              image: NetworkImage(
                "assets/login.jpg",
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
              botonEntrar2(context),
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
            image: AssetImage("logo.jpg"),
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
      child: TextField(
        decoration: InputDecoration(
          hintText: "Usuario",
          fillColor: Colors.white,
          suffixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          alignLabelWithHint: true,
        ),
      ),
    );
  }

  Widget campoPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Contraseña",
          fillColor: Colors.white,
          suffixIcon: Icon(Icons.no_encryption_sharp),
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

  Widget botonEntrar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: TextButton(
        onPressed: () {
          // Navega a la pantalla del perfil al presionar el botón
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => UserProfile()),
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

  Widget botonEntrar2(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: TextButton(
          onPressed: () {
            // Navega a la pantalla del perfil al presionar el botón
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => RejisterScreen()),
            );
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(vertical: 16.0, horizontal: 29.0),
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(fontSize: 20),
            ),
          ),
          child: Text("REGISTRATE"),
        ));
  }
}
