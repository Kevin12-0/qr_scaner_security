import 'package:flutter/material.dart';
import 'QrCode.dart';
import 'package:datos_qr/models/models.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SupabaseInserts supabaseinserts = SupabaseInserts();

  get children => null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //TextEditingController _nombre = TextEditingController(text: '');
    TextEditingController _fecha = TextEditingController(text: '');
    TextEditingController _nombreVisita = TextEditingController(text: '');
    TextEditingController _calle = TextEditingController(text: '');
    TextEditingController _colonia = TextEditingController(text: '');
    TextEditingController _lote = TextEditingController(text: '');
    TextEditingController _telefono = TextEditingController(text: '');
    TextEditingController _motivo = TextEditingController(text: '');
    TextEditingController _acompaniantes = TextEditingController(text: '');
    TextEditingController _autorizacion = TextEditingController(text: '');
    return Scaffold(
      appBar: AppBar(title: const Text('Datos codigo')),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 30.0,
        ),
        children: [
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              TextField(
                  controller: _fecha,
                  decoration: InputDecoration(
                      hintText: 'Fecha',
                      labelText: 'Fecha',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)))),
              SizedBox(
                height: 20,
                width: 15,
              ),
              TextField(
                  controller: _nombreVisita,
                  decoration: InputDecoration(
                      hintText: 'Nombre de la Visita',
                      labelText: 'Nombre de la Visita',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)))),
              SizedBox(
                height: 20,
                width: 15,
              ),
              TextField(
                  controller: _calle,
                  decoration: InputDecoration(
                      hintText: 'Calle',
                      labelText: 'Calle',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)))),
              SizedBox(height: 20, width: 15),
              TextField(
                  controller: _colonia,
                  decoration: InputDecoration(
                    hintText: 'Fraccionamiento',
                    labelText: 'Fraccionamiento',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  )),
              SizedBox(height: 20, width: 15),
              TextField(
                  controller: _lote,
                  decoration: InputDecoration(
                      hintText: 'Lote',
                      labelText: 'Lote',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)))),
              SizedBox(height: 20, width: 15),
              TextField(
                controller: _telefono,
                decoration: InputDecoration(
                    hintText: 'Telefono',
                    labelText: 'Telefono',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
              SizedBox(height: 20, width: 15),
              TextField(
                  controller: _motivo,
                  decoration: InputDecoration(
                      hintText: 'Motivo de la Visita',
                      labelText: 'Motivo de la Visita',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ))),
              SizedBox(height: 20, width: 15),
              TextField(
                  controller: _acompaniantes,
                  decoration: InputDecoration(
                      hintText: 'Acompañantes',
                      labelText: 'Acompañantes',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
              SizedBox(height: 20, width: 15),
              TextField(
                controller: _autorizacion,
                decoration: InputDecoration(
                    hintText: 'Autorización',
                    labelText: 'Autorización',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Qr_Code(
                            _fecha.text,
                            _nombreVisita.text,
                            _calle.text,
                            _colonia.text,
                            _lote.text,
                            _telefono.text,
                            _motivo.text,
                            _acompaniantes.text,
                            _autorizacion.text)));
                supabaseinserts.addData(
                    _fecha.text,
                    _nombreVisita.text,
                    _calle.text,
                    _colonia.text,
                    _lote.text,
                    _telefono.text,
                    _motivo.text,
                    _acompaniantes.text,
                    _autorizacion.text);
                setState(() {});
              },
              child: const Text('Enviar Datos')),
        ],
      ),
    );
  }
}
