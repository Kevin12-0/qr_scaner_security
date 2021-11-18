import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'mobile.dart';

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
    return Scaffold(
      appBar: AppBar(
          title: const Text("Cartus Scaner"), backgroundColor: Colors.purple),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
        children: [
          Text(qrValue,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
          SizedBox(height: 20, width: 15),
          ElevatedButton(
              child: const Text('Scannear'),
              onPressed: () {
                scannercartus();
              }),
          SizedBox(height: 20, width: 15),
          ElevatedButton(
              child: const Text('Tiket'),
              onPressed: () {
                _createPDF();
              }),
        ],
      ),
    );
  }

  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();
    page.graphics.drawString(
        'Propiedad de Comercializadora Cartus S.A de C.V\n'+'\n'+ qrValue,
        PdfStandardFont(PdfFontFamily.helvetica, 25));
    List<int> bytes = document.save();
    document.dispose();
    saveAndLaunchFile(bytes, 'Tiket.pdf');
  }
}
