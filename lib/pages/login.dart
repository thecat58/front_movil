import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: cuerpo(),
    );
  }

  Widget cuerpo() {
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
          color: const Color.fromARGB(255, 188, 187, 187)
              .withOpacity(0.5), // Ajusta la opacidad según sea necesario
        ),
        Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                logo(),
                const SizedBox(height: 20), // Espacio entre el logo y los demás widgets
                nombre(),
                campoUsuario(),
                campoPassword(),
                botonEntrar(),
                botonEntrar2(),
                const SizedBox(height: 20),
                // Botones de registro con Facebook y Google
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton.icon(
                      onPressed: () {
                        // Acción al presionar el botón de registro con Facebook
                      },
                      icon: const Icon(
                        Icons.facebook,
                        size: 50, // Tamaño del icono de Facebook
                        color: Colors.blue, // Color del icono de Facebook
                      ),
                      label: const Text(""),
                    ),
                    const SizedBox(width: 20), // Espacio entre los botones
                    ElevatedButton.icon(
                      onPressed: () {
                        // Acción al presionar el botón de registro con Google
                      },
                      icon: const Icon(
                        Icons.g_mobiledata,
                        size: 50, // Tamaño del icono de Google
                        color: Colors.red, // Color del icono de Google
                      ),
                      label: const Text(""),
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
      top: 20, // Ajusta la ubicación vertical del logo
      child: Container(
        width: 200, // Ajusta el tamaño del logo según sea necesario
        height: 200, // Ajusta el tamaño del logo según sea necesario
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60), // Añade el radio del borde de 50
          image: const DecorationImage(
            image: AssetImage("assets/logo.png"), // Cambia por la ruta de tu imagen en el directorio de activos
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget nombre() {
    return const Text("Iniciar secion ",
        style: TextStyle(
            color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold));
  }
Widget campoUsuario() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: const TextField(
      decoration: InputDecoration(
        hintText: "Usuario",
        fillColor: Colors.white,
        suffixIcon: Icon(Icons.person),
        contentPadding: EdgeInsets.symmetric(vertical: 15), // Aumenta el padding vertical para centrar el texto
        alignLabelWithHint: true, // Centra el texto del campo
      ),
    ),
  );
}



Widget campoPassword() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: const TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Contraseña",
        fillColor: Colors.white,
        suffixIcon: Icon(Icons.no_encryption_sharp),
        contentPadding: EdgeInsets.symmetric(vertical: 15), // Aumenta el padding vertical para centrar el texto
      ),
    ),
  );
}


Widget botonEntrar() {
  return Container(
    margin: const EdgeInsets.only(top: 20), // Ajusta la ubicación vertical del botón
    child: TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF3E485D), // Color de fondo personalizado
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Ajusta el padding horizontal
        textStyle: const TextStyle(fontSize: 20),
      ),
      child: const Text("               Iniciar              "),
    ),
  );
}

  Widget botonEntrar2() {
    return TextButton(
      onPressed: () {
        // Acción a realizar cuando se presione el botón de registro
      },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        // backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 29.0), // Ajusta los valores según tus preferencias
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(fontSize: 20),
        ),
        // Añade más propiedades de estilo aquí según tus necesidades
      ),
      child: const Text("REGISTRATE"),
    );
  }




}
