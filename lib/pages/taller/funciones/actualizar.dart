// import 'package:flutter/material.dart';
// import 'package:movil/pages/models/vista_taller.dart';
// import 'package:movil/pages/services/s_vista_taller.dart';

// class ActualizarTallerPage extends StatefulWidget {
//   final String id;
//   final VistaTallerService taller;

//   const ActualizarTallerPage({Key? key, required this.id, required this.taller})
//       : super(key: key);

//   @override
//   _ActualizarTallerPageState createState() => _ActualizarTallerPageState();
// }

// class _ActualizarTallerPageState extends State<ActualizarTallerPage> {
//   TextEditingController _nombreController = TextEditingController();
//   TextEditingController _direccionController = TextEditingController();
//   TextEditingController _descripcionController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     // Inicializar los controladores de texto con los valores actuales del taller
//     _nombreController.text = widget.taller.nombre;
//     _direccionController.text = widget.taller.ubicacion;
//     _descripcionController.text = widget.taller.descripcion;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Actualizar Taller'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextFormField(
//               controller: _nombreController,
//               decoration: InputDecoration(labelText: 'Nombre del taller'),
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               controller: _direccionController,
//               decoration: InputDecoration(labelText: 'Dirección'),
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               controller: _descripcionController,
//               decoration: InputDecoration(labelText: 'Descripción del taller'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 _actualizarTaller(); // Llamar al método para actualizar el taller
//               },
//               child: Text('Guardar cambios'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _actualizarTaller() async {
//     try {
//       // Crear un nuevo objeto VistaTallerService con los valores actualizados
//       VistaTallerService tallerActualizado = VistaTallerService(
//         id: int.parse(widget.id),
//         nombre: _nombreController.text,
//         ubicacion: _direccionController.text,
//         descripcion: _descripcionController.text,
//         fotoUrl: widget.taller.fotoUrl, // Mantener la URL de la foto sin cambios
//       );

//       // Llamar al servicio para actualizar el taller con el objeto actualizado
//       bool actualizado = await VistaVistaTallerServiceService.actualizarTaller(
//         widget.id,
//         tallerActualizado.nombre,
//         tallerActualizado.ubicacion,
//         tallerActualizado.descripcion,
//         tallerActualizado.fotoUrl,
//       );
      
//       if (actualizado) {
//         // Si se actualiza correctamente, mostrar un mensaje de éxito
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Taller actualizado correctamente'),
//             duration: Duration(seconds: 2),
//           ),
//         );
//       } else {
//         // Si ocurre un error al actualizar, mostrar un mensaje de error
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error al actualizar el taller'),
//             duration: Duration(seconds: 2),
//           ),
//         );
//       }
//     } catch (e) {
//       print('Error al actualizar el taller: $e');
//       // Manejar el error de alguna manera si es necesario
//     }
//   }
// }
