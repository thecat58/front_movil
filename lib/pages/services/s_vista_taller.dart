import 'package:movil/pages/models/vista_taller.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

// Servicio para realizar operaciones relacionadas con los servicios de vista de taller.
class VistaVistaTallerServiceService {
  static const String root = 'http://192.168.137.1:8000/api/taller/';
  static const String getAllAction = 'GET_ALL';
  static const String updateEmpAction = 'UPDATE_EMP';
  static const String deleteEmpAction = 'DELETE_EMP';

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

  // Actualiza un taller en el servidor por su ID.
  static Future<bool> updateTaller(String empId, File foto, String nombre, String ubicacion, String descripcion) async {
    try {
      var request = http.MultipartRequest('PUT', Uri.parse('$root$empId/'));
      request.fields['action'] = updateEmpAction;
      request.fields['nombre'] = nombre;
      request.fields['ubicacion'] = ubicacion;
      request.fields['descripcion'] = descripcion;

      if (foto != null) {
        var stream = http.ByteStream(Stream.castFrom(foto.openRead()));
        var length = await foto.length();
        var multipartFile = http.MultipartFile(
          'foto',
          stream,
          length,
          filename: foto.path.split('/').last,
        );
        request.files.add(multipartFile);
      }

      var response = await request.send();
      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Error al actualizar taller: $e');
    }
  }

  // Elimina un taller del servidor por su ID.
  static Future<bool> deleteTaller(String empId) async {
    try {
      final response = await http.delete(Uri.parse('$root$empId/?action=$deleteEmpAction'));
      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Error al eliminar taller: $e');
    }
  }
}
