import 'dart:convert';

class RegistroTaller {
  final int id;
  final String foto;
  final String nombre;
  final int usuarioTallerId;

  RegistroTaller({
    required this.id,
    required this.foto,
    required this.nombre,
    required this.usuarioTallerId,
  });

  factory RegistroTaller.fromJson(Map<String, dynamic> json) {
    return RegistroTaller(
      id: json['id'],
      foto: json['foto'],
      nombre: json['nombre'],
      usuarioTallerId: json['usuarioTallerId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'foto': foto,
      'nombre': nombre,
      'usuarioTallerId': usuarioTallerId,
    };
  }

  @override
  String toString() {
    return 'RegistroTaller{id: $id, foto: $foto, nombre: $nombre, usuarioTallerId: $usuarioTallerId}';
  }
}
