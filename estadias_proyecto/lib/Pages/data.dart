import 'package:flutter/material.dart';

class DataRead extends StatefulWidget {

  @override
  _DataReadState createState() => _DataReadState();
}

class _DataReadState extends State<DataRead> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Object>(
        future: getDatos(),
        builder: (context, snapshot){
          return Column(
            children: [

            ],
          );
        }
      ),
    );
  }

  List <Data> getDatos() {

  }
}

class Data {
}