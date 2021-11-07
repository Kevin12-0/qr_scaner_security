import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ScannerCartus extends StatefulWidget {
  ScannerCartus({Key key}) : super(key: key);

  @override
  _ScannerCartusState createState() => _ScannerCartusState();
}

class _ScannerCartusState extends State<ScannerCartus> {

  String qrValue = 'Datos de codigo qr';

  @override
  void scannercartus() async {
    String cameraScanResult = await scanner.scan();
    setState(() {
      qrValue = cameraScanResult;
    });
  } 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Scanner Cartus",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text("Scanner Cartus"),
        ),
        body:  Center(
          child: Container(
            child: Text(
              qrValue,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15)
            )
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          onPressed: () => scannercartus(),
          child: Icon(Icons.camera),
        ),
      ),
    );
  }
}
