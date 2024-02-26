import 'package:flutter/material.dart';
import 'package:movil/pages/login.dart';

class RejisterScreen extends StatelessWidget {
  const RejisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: cuerpo(context),
    );
  }

  Widget cuerpo(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage("assets/registro.jpg"), fit: BoxFit.cover)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            nombre(),
            campoUsuario(),
            campoUcorreo(),
            campoJenero(),
            campoPassword(),
            botonEntrar(context)
          ],
        ),
      ),
    );
  }

  Widget nombre() {
    return Text("Rejistrate",
        style: TextStyle(
            color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold));
  }

  Widget campoUsuario() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: TextField(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              hintText: "Usuario",
              fillColor: Colors.white,
              filled: true),
        ));
  }

  Widget campoJenero() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        child: TextField(
          decoration: InputDecoration(
                          border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              hintText: "genero", fillColor: Colors.white, filled: true),
        ));
  }

  Widget campoUcorreo() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        child: TextField(
          decoration: InputDecoration(
                          border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              hintText: "correo", fillColor: Colors.white, filled: true),
        ));
  }

  Widget campoPassword() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
                          border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              hintText: "Contraseña", fillColor: Colors.white, filled: true),
        ));
  }

  Widget botonEntrar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: TextButton(
        onPressed: () {
          // Navega a la pantalla del perfil al presionar el botón
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        padding: const EdgeInsets.all(16.0),
        textStyle: const TextStyle(fontSize: 20),
      ),
      child: Text("Rejistrate"),
    ));
  }
}
