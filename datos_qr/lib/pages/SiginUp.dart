import 'package:datos_qr/pages/SiginUpComplete.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';
import 'package:datos_qr/models/models2.dart';
import 'SiginUpComplete.dart';

class SiginUpPage extends StatefulWidget {
  SiginUpPage({Key key}) : super(key: key);

  @override
  _SiginUpPageState createState() => _SiginUpPageState();
}

class _SiginUpPageState extends State<SiginUpPage> {
  SupabaseInsertsClients clientes = SupabaseInsertsClients();

  TextEditingController _nombre = TextEditingController(text: '');
  TextEditingController _contacto = TextEditingController(text: '');
  TextEditingController _edad = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    _nombre = new TextEditingController();
    _contacto = new TextEditingController();
    _edad = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 30.0,
        ),
        children: [
          Column(
            children: [
              TextField(
                  controller: _nombre,
                  decoration: InputDecoration(
                      hintText: 'Nombre completo',
                      labelText: 'Nombre completo',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)))),
              SizedBox(height: 20, width: 15),
              TextField(
                  controller: _contacto,
                  decoration: InputDecoration(
                      hintText: 'Numero de telefono',
                      labelText: 'Numero de telefono',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)))),
              SizedBox(height: 20, width: 15),
              TextField(
                controller: _edad,
                decoration: InputDecoration(
                    hintText: 'Edad',
                    labelText: 'Edad',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
              SizedBox(height: 20, width: 15),
              ElevatedButton(
                  child: const Text('Siguiente'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SiginUpComplete()));
                    clientes.addCliente(
                        _nombre.text, _contacto.text, _edad.text);
                    setState(() {});
                  })
            ],
          )
        ],
      ),
    );
  }
}
