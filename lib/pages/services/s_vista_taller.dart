import 'package:movil/pages/models/vista_taller.dart'; // Importación del modelo VistaTallerService
import 'dart:convert';
import 'package:http/http.dart' as http;

// Servicio para realizar operaciones relacionadas con los servicios de vista de taller.
class VistaVistaTallerServiceService {
  static const String root = 'http://192.168.80.22:8000/api/taller/';
  static const String getAllAction = 'GET_ALL';

  // Obtiene una lista de servicios de vista de taller del servidor.
  static Future<List<VistaTallerService>> getVistaTallerServices() async {
    try {
      final response = await http.get(Uri.parse('$root?action=$getAllAction')); // Utilización de interpolación de cadenas
      if (response.statusCode == 200) {
        List<VistaTallerService> list = parseResponse(response.body);
        return list;
      } else {
        throw Exception('Error al cargar VistaTallerServices');
      }
    } catch (e) {
      throw Exception('Error al cargar VistaTallerServices: $e');
    }
  }
 
  // Parsea la respuesta del servidor y la convierte en una lista de [VistaTallerService].
  // El parámetro [responseBody] es la respuesta del servidor en formato JSON.
  static List<VistaTallerService> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody);
    return parsed.map<VistaTallerService>((json) => VistaTallerService.fromJson(json)).toList();
  }
}
