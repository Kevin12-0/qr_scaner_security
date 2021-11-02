import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qr_Code extends StatelessWidget {
  //final String nombre;
  final String fecha;
  final String nombrevisita;
  final String calle;
  final String lote;
  final String colonia;
  final String telefono;
  final String motivo;
  final String acompaniantes;
  final String autorizacion;

  //this.nombre, this.apellido, this.descripcion, this.calle,

  const Qr_Code(
      this.fecha,
      this.nombrevisita,
      this.calle,
      this.colonia,
      this.lote,
      this.telefono,
      this.motivo,
      this.acompaniantes,
      this.autorizacion,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var codigo_qr = 'Fecha: ' +
        fecha +
        '\nNombre de la visita: ' +
        nombrevisita +
        '\nCalle: ' +
        calle +
        '\nColonia: ' +
        colonia +
        '\nLote: ' +
        lote +
        '\nTelefono: ' +
        telefono +
        '\nMotivo de la visita: ' +
        motivo +
        '\nNo. de Acompañantes: ' +
        acompaniantes +
        '\nNombre de quien autoriza: ' +
        autorizacion;
    return Scaffold(
      appBar: AppBar(title: const Text('Generar')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Tome Captura y comparta el QR',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            QrImage(
              data: codigo_qr,
              size: 200,
            ),
          ],
        ),
      ),
    );
  }
}
