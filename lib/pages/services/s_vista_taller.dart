import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movil/pages/models/vista_taller.dart';

class VistaVistaTallerServiceService {
  static const String root = 'http://192.168.137.70:8000/api/taller/';
  static const String getAllAction = 'GET_ALL';
  static const String _updateTallerAction = "update_taller";
  static const String deleteEmpAction = 'DELETE_EMP';

  static Future<List<VistaTallerService>> getVistaTallerServices() async {
    try {
      final response = await http.get(Uri.parse('$root?action=$getAllAction'));
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

  static List<VistaTallerService> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody);
    return parsed
        .map<VistaTallerService>((json) => VistaTallerService.fromJson(json))
        .toList();
  }

  static Future<bool> actualizarTaller(String tallerId, String nombre,
      String ubicacion, String descripcion, String fotoUrl) async {
    try {
      var map = {
        'action': _updateTallerAction,
        'id': tallerId,
        'nombre': nombre,
        'ubicacion': ubicacion,
        'descripcion': descripcion,
        'fotoUrl': fotoUrl,
      };

      final url = '$root$tallerId/';
      print('URL de la solicitud PUT: $url');
      final response = await http.put(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(map),
      );

      print('actualizarTaller Response: ${response.body}');

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error al actualizar taller: $e');
      return false;
    }
  }

  // Elimina un taller del servidor por su ID.
  static Future<bool> deleteTaller(String empId) async {
    try {
      final response =
          await http.delete(Uri.parse('$root$empId/?action=$deleteEmpAction'));
      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Error al eliminar taller: $e');
    }
  }

  static obtenerTalleres() {}
}
