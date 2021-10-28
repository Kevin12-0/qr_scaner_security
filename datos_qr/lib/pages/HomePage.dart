import 'package:flutter/material.dart';
import 'QrCode.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _nombre = TextEditingController(text: '');
    TextEditingController _apellido = TextEditingController(text: '');

    return Scaffold(
      appBar: AppBar(title: const Text('Datos codigo')),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              TextField(
                  controller: _nombre,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)))),
              SizedBox(
                height: 20,
                width: 15,
              ),
              TextField(
                  controller: _apellido,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)))),
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
                        builder: (context) => Qr_Code(_nombre.text, _apellido.text )));
              },
              child: const Text('Enviar Datos')),
        ],
      ),
    );
  }
}
