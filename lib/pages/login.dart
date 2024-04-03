import 'package:flutter/material.dart';
import 'package:movil/pages/nav.dart';
import 'package:movil/pages/services/loginControler.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();

  bool _isButtonEnabled = false;

  void _validateFields() {
    final usuario = usuarioController.text.trim();
    final contrasena = contrasenaController.text.trim();
    setState(() {
      _isButtonEnabled = usuario.isNotEmpty && contrasena.isNotEmpty;
    });
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Cerrar',
          onPressed: () {
            usuarioController.clear();
            contrasenaController.clear();
          },
        ),
      ),
    );
  }

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                logo(),
                SizedBox(height: 20),
                nombre(),
                SizedBox(height: 20),
                campoUsuario(),
                SizedBox(height: 10),
                campoPassword(),
                SizedBox(height: 20),
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
          onChanged: (_) => _validateFields(),
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
          onChanged: (_) => _validateFields(),
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
        onPressed: _isButtonEnabled
            ? () {
                LoginController.login(
                  usuarioController.text.trim(),
                  contrasenaController.text.trim(),
                ).then((success) {
                  if (success) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomBottomNavigationBar(),
                      ),
                    );
                  } else {
                    _showSnackBar(context, 'Este usuario no está registrado Registarate desde el sitio Web');
                  }
                });
              }
            : null,
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