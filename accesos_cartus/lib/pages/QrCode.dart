import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qr_Code extends StatelessWidget {
  //final String nombre;
  final String fecha;
  final String nombrevisita;
  final String calle;
  final String colonia;
  final String lote; //
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
    var codigo_qr = 'Fecha: \n' +
        fecha +
        '\nNombre de la visita:\n ' +
        nombrevisita +
        '\nCalle: \n' +
        calle +
        '\nFraccionamiento: \n' +
        colonia +
        '\nLote: \n' +
        lote +
        '\nTelefono: \n' +
        telefono +
        '\nMotivo de la visita: \n' +
        motivo +
        '\nNo. de Acompañantes: \n' +
        acompaniantes +
        '\nAutorización: \n' +
        autorizacion +
        '\n---Cualquier acalaracion,se usara\neste tiket---';
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
              backgroundColor: Colors.blue,
              foregroundColor: Colors.purpleAccent[400],
            ),
          ],
        ),
      ),
    );
  }
}
