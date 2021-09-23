import 'dart:html';

import 'package:estadias_proyecto/main.dart';
import 'package:estadias_proyecto/models/datos.dart';
import 'package:flutter/material.dart';

class DataSaw extends StatefulWidget {

  @override
  _DataSawState createState() => _DataSawState();
}

class _DataSawState extends State<DataSaw> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder<List<Datos>>(
        future: getData(),
        builder:(context, snapshot){
          return ListView(
            children: snapshot.data.map((datos) => ListTile(
              title: Text(datos.Name),
              subtitle: Text(datos.Apellidos)
            )).toList(),
          );
        }
      )       
    );
  }

  Future<List<Datos>>getData() async{
    final response = await supabaseClient
    .from('registros')
    .select()
    .order('Name', ascending: true)
    .execute();

    final datalist = response.data as List;
    return datalist.map((map) => Datos.fromJSON(map)).toList();

  }
}

