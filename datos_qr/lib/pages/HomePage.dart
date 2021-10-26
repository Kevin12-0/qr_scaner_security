import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _nombre;
  late TextEditingController _apellido;

  void initState() {
    super.initState();

    _nombre = TextEditingController();
    _apellido = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 90,
          ),
        children: [
          SizedBox(
            width: 25,
          ),
          TextField(
            controller: _nombre,
          ),
        ],
        ),
        
      ),
    );
  }
}
