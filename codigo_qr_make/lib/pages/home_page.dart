import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String data = '123456';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QR CODE")),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Text('Codigo generado como texto:\n $data',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
          SizedBox(height: 16),
          QrImage(
            data: data,
            size: 200,
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
        ]),
      ),
    );
  }
}
