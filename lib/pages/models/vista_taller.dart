/// Modelo para representar un taller en la vista de servicios.
class VistaTallerService {
  final int id;
  final String nombre;
  final String ubicacion;
  final String descripcion;
  final String fotoUrl; // Suponiendo que el backend devuelve la URL de la imagen

  // Constructor de la clase 
  VistaTallerService({
    required this.id,
    required this.nombre,
    required this.ubicacion,
    required this.descripcion,
    required this.fotoUrl,
  });

  // Método factory para crear una instancia de [VistaTallerService] a partir de un mapa JSON.
  factory VistaTallerService.fromJson(Map<String, dynamic> json) {
    return VistaTallerService(
      id: json['id'],
      nombre: json['nombre'] ?? '',
      ubicacion: json['ubicacion'] ?? '',
      descripcion: json['descripcion'] ?? '', // Asegúrate de que la clave 'descripcion' existe en tu JSON
      fotoUrl: json['foto'] ?? '', // Suponiendo que el backend devuelve la URL de la imagen
    );
  }
}
