import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'mobile.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        child: const Text('Generar pdf'),
        onPressed: _createPDF,
      ),
    ));
  }

  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();
    page.graphics.drawString(
        'Hello World !!', PdfStandardFont(PdfFontFamily.helvetica, 30));
    List<int> bytes = document.save();
    document.dispose();
    saveAndLaunchFile(bytes, "Output.pdf");
  }
}
