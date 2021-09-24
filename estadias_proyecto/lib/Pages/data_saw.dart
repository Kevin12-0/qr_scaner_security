import 'package:estadias_proyecto/main.dart';
import 'package:estadias_proyecto/models/datos.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';

class DataSaw extends StatefulWidget {
  @override
  _DataSawState createState() => _DataSawState();
}

class _DataSawState extends State<DataSaw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Datos>>(
            future: getData(),
            builder: (context, snapshot) {
              if(snapshot.hasData == false) {
                return CircularProgressIndicator();
              }
              return ListView(
                children: newMethod(snapshot)
                    .toList(),
              );
            }));
  }

  Iterable<ListTile> newMethod(AsyncSnapshot<List<Datos>> snapshot) {
    return snapshot.data
                  .map((Datos) => ListTile(
                      title: Text(Datos.Name),
                      subtitle: Text(Datos.Apelliddos)));
  }

  Future<List<Datos>> getData() async {
    final response = await Injector.appInstance
      .get<SupabaseClient>()
      .from('registros')
      .select()
      .order('Name', ascending: true)
      .execute();

    final datalist = response.data as List;
    return datalist.map((map) => Datos.fromJSON(map)).toList();
  }
}
