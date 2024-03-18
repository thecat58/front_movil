class Taller {
  final int id;
  final String nombre;
  final String ubicacion;
  final String fotoUrl; // Suponiendo que el backend devuelve la URL de la imagen

  Taller({
    required this.id,
    required this.nombre,
    required this.ubicacion,
    required this.fotoUrl,
  });

  factory Taller.fromJson(Map<String, dynamic> json) {
    return Taller(
      id: json['id'],
      nombre: json['nombre'] ?? '',
      ubicacion: json['ubicacion'] ?? '',
      fotoUrl: json['foto'] ?? '', // Suponiendo que el backend devuelve la URL de la imagen
    );
  }
}
