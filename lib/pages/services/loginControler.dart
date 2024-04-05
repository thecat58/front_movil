import 'package:http/http.dart' as http;

class LoginController {
  static Future<bool> login(String usuario, String contrasena) async {
    try {
      http.Response response = await http.post(
        Uri.parse('http://192.168.137.74:8000/api/login/'),
        // localhost:53380
        body: {
          'email': usuario,
          'password': contrasena,
        },
      );

      if (response.statusCode == 200) {
        print('Inicio de sesión exitoso');
        return true; // Devuelve true si el inicio de sesión fue exitoso
      } else {
        print('Error en la solicitud: ${response.statusCode}');
        return false; // Devuelve false si hubo un error en el inicio de sesión
      }
    } catch (e) {
      print('Error en la solicitud: $e');
      return false; // Devuelve false si hubo un error en la solicitud
    }
  }
}
