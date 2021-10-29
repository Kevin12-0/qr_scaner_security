import 'package:flutter/material.dart';
import 'QrCode.dart';
import 'package:datos_qr/models/models.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

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
    TextEditingController _nombre = TextEditingController(text: '');
    TextEditingController _apellido = TextEditingController(text: '');
    TextEditingController _descripcion = TextEditingController(text: '');
    TextEditingController _calle = TextEditingController(text: '');

    return Scaffold(
      appBar: AppBar(title: const Text('Datos codigo')),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 90.0,
        ),
        children: [
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              TextField(
                  controller: _nombre,
                  decoration: InputDecoration(
                      hintText: 'Nombre(s)',
                      labelText: 'Nombres(s)',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)))),
              SizedBox(
                height: 20,
                width: 15,
              ),
              TextField(
                  controller: _apellido,
                  decoration: InputDecoration(
                      hintText: 'Apellidos',
                      labelText: 'Apellidos',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)))),
              SizedBox(
                height: 20,
                width: 15,
              ),
              TextField(
                  controller: _descripcion,
                  decoration: InputDecoration(
                      hintText: 'Descripción',
                      labelText: 'Descripcion',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)))),
              SizedBox(height: 20, width: 15),
              TextField(
                  controller: _calle,
                  decoration: InputDecoration(
                    hintText: 'Calle',
                    labelText: 'Calle',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  )),
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
                            _nombre.text, _apellido.text, _descripcion.text,_calle.text)));
                supabaseinserts.addData(
                    _nombre.text, _apellido.text, _descripcion.text, _calle.text);
                setState(() {});
              },
              child: const Text('Enviar Datos')),
        ],
      ),
    );
  }
}
