import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ServicioRegistroTaller {
  static Future<bool> registrarTaller(String nombre, String categoria, String descripcion, String imagenPath) async {
    // Endpoint en tu backend para registrar el taller
    var url = Uri.parse('');

    // Lectura de la imagen
    var imagenBytes = File(imagenPath).readAsBytesSync();
    var imagenBase64 = base64Encode(imagenBytes);

    // Construir el cuerpo de la solicitud
    var body = jsonEncode({
      'nombre': nombre,
      'categoria': categoria,
      'descripcion': descripcion,
      'imagen': imagenBase64,
    });

    try {
      // Realizar la solicitud POST al backend
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );

      // Verificar si la solicitud fue exitosa (código de estado 200)
      if (response.statusCode == 200) {
        // El taller se registró correctamente
        return true;
      } else {
        // Hubo un error al registrar el taller
        print('Error al registrar el taller: ${response.body}');
        return false;
      }
    } catch (e) {
      // Manejar errores de conexión
      print('Error de conexión: $e');
      return false;
    }
  }
}
