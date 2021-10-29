import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qr_Code extends StatelessWidget {
  final String nombre;
  final String apellido;
  final String descripcion;
  final String calle;

  const Qr_Code(this.nombre, this.apellido, this.descripcion, this.calle, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nombreCompleto = 'Nombre: ' +
        nombre +
        "\nApellido: " +
        apellido +
        "\nDescripción: " +
        descripcion + "\nCalle: " + calle;
    return Scaffold(
      appBar: AppBar(title: const Text('Generar')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Tome Captura y mande el QR',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            QrImage(
              data: nombreCompleto,
              size: 200,
            ),
          ],
        ),
      ),
    );
  }
}
