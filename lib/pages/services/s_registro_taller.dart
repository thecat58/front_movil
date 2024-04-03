import '../models/registro_taller.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class TallerService {
  static const ROOT = 'http://192.168.137.1:8000/api/taller/';
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _ADD_EMP_ACTION = 'ADD_EMP';
  static const _UPDATE_EMP_ACTION = 'UPDATE_EMP';
  static const _DELETE_EMP_ACTION = 'DELETE_EMP';

  static Future<bool> addTallers(File foto, String nombre, String ubicacion, String descripcion) async {
  try {
    var request = http.MultipartRequest('POST', Uri.parse(ROOT));
    request.fields['action'] = _ADD_EMP_ACTION;
    request.fields['nombre'] = nombre ?? '';
    request.fields['ubicacion'] = ubicacion ?? '';
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
    // Verifica si la solicitud se completó exitosamente
    if (response.statusCode == 201) { // Cambia el código de estado según lo que devuelve tu servidor
      return true;
    } else {
      return false;
    }
  } catch (e) {
    throw Exception('Error al agregar taller: $e');
  }
}


  static Future<bool> updateTaller(String empId, File foto, String nombre, String ubicacion, String descripcion) async {
    try {
      var request = http.MultipartRequest('PUT', Uri.parse(ROOT + empId + '/'));
      request.fields['action'] = _UPDATE_EMP_ACTION;
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

static Future<bool> deleteTaller(String empId) async {
  try {
    final response = await http.delete(Uri.parse(ROOT + empId + '/?action=$_DELETE_EMP_ACTION'));
    return response.statusCode == 200;
  } catch (e) {
    throw Exception('Error al eliminar taller: $e');
  }
}

}
